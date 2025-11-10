<!-- MODAL TAMBAH -->
<div class="modal fade" data-bs-backdrop="static" id="modaldemo8">
    <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
        <div class="modal-content modal-content-demo">
            <div class="modal-header">
                <h6 class="modal-title">Tambah Barang Masuk</h6>
                <button onclick="resetForm()" aria-label="Close" class="btn-close" data-bs-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <div class="row">
                    <!-- Informasi Transaksi -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="bmkode" class="form-label">Kode Barang Masuk <span class="text-danger">*</span></label>
                            <input type="text" name="bmkode" readonly class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="tglmasuk" class="form-label">Tanggal Masuk <span class="text-danger">*</span></label>
                            <input type="text" name="tglmasuk" class="form-control datepicker-date">
                        </div>
                        <div class="form-group">
                            <label for="customer" class="form-label">Pilih Customer <span class="text-danger">*</span></label>
                            <select name="customer" id="customer" class="form-control">
                                <option value="">-- Pilih Customer --</option>
                                @foreach ($customer as $c)
                                <option value="{{ $c->customer_id }}">{{ $c->customer_nama }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <!-- Input Barang -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Kode Barang <span class="text-danger">*</span>
                                <input type="hidden" id="status" value="false">
                                <div class="spinner-border spinner-border-sm d-none" id="loaderkd" role="status">
                                    <span class="visually-hidden">Loading...</span>
                                </div>
                            </label>
                            <div class="input-group">
                                <input type="text" class="form-control" autocomplete="off" name="kdbarang">
                                <button class="btn btn-primary-light" onclick="searchBarang()" type="button"><i class="fe fe-search"></i></button>
                                <button class="btn btn-success-light" onclick="modalBarang()" type="button"><i class="fe fe-box"></i></button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Nama Barang</label>
                            <input type="text" class="form-control" id="nmbarang" readonly>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Satuan</label>
                                    <input type="text" class="form-control" id="satuan" readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Jenis</label>
                                    <input type="text" class="form-control" id="jenis" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="jml" class="form-label">Jumlah Masuk <span class="text-danger">*</span></label>
                            <input type="text" name="jml" value="0" class="form-control"
                                oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1').replace(/^0[^.]/, '0');">
                        </div>
                        <button type="button" class="btn btn-info mt-2" onclick="tambahKeranjang()">Tambah ke Daftar</button>
                    </div>
                </div>

                <hr>

                <!-- Tabel Keranjang -->
                <h6>Daftar Barang Masuk</h6>
                <table class="table table-bordered" id="tabelKeranjang">
                    <thead>
                        <tr>
                            <th>Kode</th>
                            <th>Nama</th>
                            <th>Satuan</th>
                            <th>Jenis</th>
                            <th>Jumlah</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>

            </div>

            <div class="modal-footer">
                <button class="btn btn-primary d-none" id="btnLoader" type="button" disabled="">
                    <span class="spinner-border spinner-border-sm me-1" role="status" aria-hidden="true"></span>
                    Loading...
                </button>
                <a href="javascript:void(0)" onclick="simpanTransaksi()" id="btnSimpan" class="btn btn-primary">Simpan Transaksi <i class="fe fe-check"></i></a>
                <a href="javascript:void(0)" class="btn btn-light" onclick="resetForm()" data-bs-dismiss="modal">Batal <i class="fe fe-x"></i></a>
            </div>
        </div>
    </div>
</div>


@section('formTambahJS')
<script>
    let keranjang = [];

    $('input[name="kdbarang"]').keypress(function(event) {
        if (event.which == 13) {
            getbarangbyid($('input[name="kdbarang"]').val());
        }
    });

    function modalBarang() {
        $('#modalBarang').modal('show');
        $('#modaldemo8').addClass('d-none');
        $('input[name="param"]').val('tambah');
        resetValid();
        table2.ajax.reload();
    }

    function searchBarang() {
        getbarangbyid($('input[name="kdbarang"]').val());
        resetValid();
    }

    function getbarangbyid(id) {
        $("#loaderkd").removeClass('d-none');
        $.ajax({
            type: 'GET',
            url: "{{ url('admin/barang/getbarang') }}/" + id,
            dataType: 'json',
            success: function(data) {
                $("#loaderkd").addClass('d-none');
                if (data.length > 0) {
                    $("#status").val("true");
                    $("#nmbarang").val(data[0].barang_nama);
                    $("#satuan").val(data[0].satuan_nama);
                    $("#jenis").val(data[0].jenisbarang_nama);
                } else {
                    $("#status").val("false");
                    $("#nmbarang").val('');
                    $("#satuan").val('');
                    $("#jenis").val('');
                }
            }
        });
    }

    function tambahKeranjang() {
        const status = $("#status").val();
        const kdbarang = $("input[name='kdbarang']").val();
        const nmbarang = $("#nmbarang").val();
        const satuan = $("#satuan").val();
        const jenis = $("#jenis").val();
        const jml = $("input[name='jml']").val();

        if (status == "false" || kdbarang == "" || jml == "" || jml == "0") {
            validasi('Barang dan jumlah wajib diisi!', 'warning');
            return;
        }

        keranjang.push({
            kdbarang, nmbarang, satuan, jenis, jml
        });
        renderKeranjang();
        resetBarang();
    }

    function renderKeranjang() {
        let html = "";
        keranjang.forEach((item, index) => {
            html += `<tr>
                <td>${item.kdbarang}</td>
                <td>${item.nmbarang}</td>
                <td>${item.satuan}</td>
                <td>${item.jenis}</td>
                <td>${item.jml}</td>
                <td><button type="button" class="btn btn-danger btn-sm" onclick="hapusItem(${index})">Hapus</button></td>
            </tr>`;
        });
        $("#tabelKeranjang tbody").html(html);
    }

    function hapusItem(index) {
        keranjang.splice(index, 1);
        renderKeranjang();
    }

    function simpanTransaksi() {
        const bmkode = $("input[name='bmkode']").val();
        const tglmasuk = $("input[name='tglmasuk']").val();
        const customer = $("select[name='customer']").val();

        if (tglmasuk == "" || customer == "" || keranjang.length == 0) {
            validasi('Tanggal, Customer, dan Barang wajib diisi!', 'warning');
            return;
        }

        setLoading(true);

        $.ajax({
            type: 'POST',
            url: "{{ route('barang-masuk.store') }}",
            data: {
                bmkode: bmkode,
                tglmasuk: tglmasuk,
                customer: customer,
                barang: keranjang.map(i => i.kdbarang),
                jml: keranjang.map(i => i.jml)
            },
            success: function(data) {
                $('#modaldemo8').modal('toggle');
                swal({ title: "Berhasil ditambah!", type: "success" });
                table.ajax.reload(null, false);
                resetForm();
            },
            error: function(err) {
                swal({ title: "Gagal menyimpan!", type: "error" });
            },
            complete: function() {
                setLoading(false);
            }
        });
    }

    function resetBarang() {
        $("input[name='kdbarang']").val('');
        $("input[name='jml']").val('0');
        $("#nmbarang").val('');
        $("#satuan").val('');
        $("#jenis").val('');
        $("#status").val('false');
    }

    function resetForm() {
        keranjang = [];
        renderKeranjang();
        $("input[name='bmkode']").val('');
        $("input[name='tglmasuk']").val('');
        $("select[name='customer']").val('');
        resetBarang();
        resetValid();
        setLoading(false);
    }

    function resetValid() {
        $("input[name='tglmasuk']").removeClass('is-invalid');
        $("select[name='customer']").removeClass('is-invalid');
        $("input[name='kdbarang']").removeClass('is-invalid');
        $("input[name='jml']").removeClass('is-invalid');
    }

    function setLoading(bool) {
        if (bool) {
            $('#btnLoader').removeClass('d-none');
            $('#btnSimpan').addClass('d-none');
        } else {
            $('#btnSimpan').removeClass('d-none');
            $('#btnLoader').addClass('d-none');
        }
    }
</script>
@endsection
