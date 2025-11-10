<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\AksesModel;
use App\Models\Admin\BarangkeluarModel;
use App\Models\Admin\BarangModel;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Yajra\DataTables\DataTables;

class BarangkeluarController extends Controller
{
    public function index()
    {
        $roleId = Session::get('user') ? Session::get('user')->role_id : null;

        $data["title"] = "Barang Keluar";

        if ($roleId) {
            $data["hakTambah"] = AksesModel::leftJoin('tbl_submenu', 'tbl_submenu.submenu_id', '=', 'tbl_akses.submenu_id')
                ->where([
                    'tbl_akses.role_id' => $roleId,
                    'tbl_submenu.submenu_judul' => 'Barang Keluar',
                    'tbl_akses.akses_type' => 'create'
                ])->count();
        } else {
            $data["hakTambah"] = 0;
        }

        return view('Admin.BarangKeluar.index', $data);
    }

    public function show(Request $request)
    {
        if ($request->ajax()) {
            $data = BarangkeluarModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangkeluar.barang_kode')
                ->orderBy('bk_id', 'DESC')->get();

            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('tgl', function ($row) {
                    return $row->bk_tanggal == '' ? '-' : Carbon::parse($row->bk_tanggal)->translatedFormat('d F Y');
                })
                ->addColumn('tujuan', function ($row) {
                    return $row->bk_tujuan == '' ? '-' : $row->bk_tujuan;
                })
                ->addColumn('barang', function ($row) {
                    return isset($row->barang_nama) && $row->barang_nama != '' ? $row->barang_nama : '-';
                })
                ->addColumn('action', function ($row) {
                    $roleId = Session::get('user') ? Session::get('user')->role_id : null;

                    $array = [
                        "bk_id" => $row->bk_id,
                        "bk_kode" => $row->bk_kode,
                        "barang_kode" => $row->barang_kode,
                        "bk_tanggal" => $row->bk_tanggal,
                        "bk_tujuan" => trim(preg_replace('/[^A-Za-z0-9-]+/', '_', $row->bk_tujuan)),
                        "bk_jumlah" => $row->bk_jumlah
                    ];

                    $button = '-';
                    $hakEdit = 0;
                    $hakDelete = 0;

                    if ($roleId) {
                        $hakEdit = AksesModel::leftJoin('tbl_submenu', 'tbl_submenu.submenu_id', '=', 'tbl_akses.submenu_id')
                            ->where([
                                'tbl_akses.role_id' => $roleId,
                                'tbl_submenu.submenu_judul' => 'Barang Keluar',
                                'tbl_akses.akses_type' => 'update'
                            ])->count();

                        $hakDelete = AksesModel::leftJoin('tbl_submenu', 'tbl_submenu.submenu_id', '=', 'tbl_akses.submenu_id')
                            ->where([
                                'tbl_akses.role_id' => $roleId,
                                'tbl_submenu.submenu_judul' => 'Barang Keluar',
                                'tbl_akses.akses_type' => 'delete'
                            ])->count();
                    }

                    if ($hakEdit > 0 || $hakDelete > 0) {
                        $button = '<div class="g-2">';
                        if ($hakEdit > 0) {
                            $button .= '<a class="btn modal-effect text-primary btn-sm" data-bs-effect="effect-super-scaled" data-bs-toggle="modal" href="#Umodaldemo8" onclick=update(' . json_encode($array) . ')><span class="fe fe-edit text-success fs-14"></span></a>';
                        }
                        if ($hakDelete > 0) {
                            $button .= '<a class="btn modal-effect text-danger btn-sm" data-bs-effect="effect-super-scaled" data-bs-toggle="modal" href="#Hmodaldemo8" onclick=hapus(' . json_encode($array) . ')><span class="fe fe-trash-2 fs-14"></span></a>';
                        }
                        $button .= '</div>';
                    }

                    return $button;
                })
                ->rawColumns(['action', 'tgl', 'tujuan', 'barang'])->make(true);
        }
    }

    public function proses_tambah(Request $request)
    {
        $bkkode   = $request->bkkode;
        $tglkeluar = $request->tglkeluar;
        $tujuan    = $request->tujuan;
        $barangs   = $request->input('barang'); // array kode barang
        $jmls      = $request->input('jml');    // array jumlah

        if (!is_array($barangs) || count($barangs) == 0) {
            return response()->json(['error' => 'Tidak ada barang dikirim'], 422);
        }

        $dataToInsert = [];
        $now = Carbon::now();

        foreach ($barangs as $i => $kodeBarang) {
            $qty = intval($jmls[$i] ?? 0);
            if ($qty <= 0) continue;

            // 🔎 cek stok
            $barang = BarangModel::where('barang_kode', $kodeBarang)->first();
            if (!$barang) {
                return response()->json(['error' => "Barang dengan kode {$kodeBarang} tidak ditemukan"], 422);
            }

            if ($barang->barang_stok < $qty) {
                return response()->json([
                    'error' => "Stok barang {$barang->barang_nama} tidak mencukupi. 
                                Sisa stok: {$barang->barang_stok}, diminta: {$qty}"
                ], 422);
            }

            // ✅ kurangi stok
            $barang->barang_stok -= $qty;
            $barang->save();

            $dataToInsert[] = [
                'bk_tanggal'   => $tglkeluar,
                'bk_kode'      => $bkkode,
                'barang_kode'  => $kodeBarang,
                'bk_tujuan'    => $tujuan,
                'bk_jumlah'    => $qty,
                'created_at'   => $now,
                'updated_at'   => $now,
            ];
        }

        if (count($dataToInsert) > 0) {
            BarangkeluarModel::insert($dataToInsert);
            return response()->json(['success' => 'Berhasil simpan ' . count($dataToInsert) . ' item']);
        }

        return response()->json(['error' => 'Tidak ada data valid untuk disimpan'], 422);
    }

    public function proses_ubah(Request $request, BarangkeluarModel $barangkeluar)
    {
        $barangkeluar->update([
            'bk_tanggal' => $request->tglkeluar,
            'bk_kode' => $request->bkkode,
            'barang_kode' => $request->barang,
            'bk_tujuan'   => $request->tujuan,
            'bk_jumlah'   => $request->jml,
        ]);

        return response()->json(['success' => 'Berhasil']);
    }

    public function proses_hapus(Request $request, BarangkeluarModel $barangkeluar)
    {
        $barangkeluar->delete();
        return response()->json(['success' => 'Berhasil']);
    }
}
