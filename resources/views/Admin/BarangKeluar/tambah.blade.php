<!-- MODAL TAMBAH BARANG KELUAR -->
<div class="modal fade" data-bs-backdrop="static" id="modaldemo8">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content modal-content-demo">
            <div class="modal-header">
                <h6 class="modal-title">Tambah Barang Keluar</h6>
                <button onclick="reset()" aria-label="Close" class="btn-close" data-bs-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <!-- Kode, Tanggal, Tujuan -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="bkkode" class="form-label">Kode Barang Keluar <span class="text-danger">*</span></label>
                            <input type="text" name="bkkode" readonly class="form-control" placeholder="">
                        </div>
                        <div class="form-group">
                            <label for="tglkeluar" class="form-label">Tanggal Keluar <span class="text-danger">*</span></label>
                            <input type="text" name="tglkeluar" class="form-control datepicker-date" placeholder="">
                        </div>
                        <div class="form-group">
                            <label for="tujuan" class="form-label">Tujuan <span class="text-danger">*</span></label>
                            <input type="text" name="tujuan" class="form-control" placeholder="Tujuan barang keluar">
                        </div>
                    </div>

                    <!-- Input Barang -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Kode Barang <span class="text-danger">*</span></label>
                            <input type="hidden" id="status" value="false">
                            <div class="input-group">
                                <input type="text" class="form-control" autocomplete="off" name="kdbarang" placeholder="">
                                <button class="btn btn-primary-light" onclick="searchBarang()" type="button"><i class="fe fe-search"></i></button>
                                <button class="btn btn-success-light" onclick="modalBarang()" type="button"><i class="fe fe-box"></i></button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Nama Barang</label>
                            <input type="text" class="form-control" id="nmbarang" readonly>
                        </div>
                        <div class="form-group">
                            <label for="jml" class="form-label">Jumlah Keluar <span class="text-danger">*</span></label>
                            <input type="text" name="jml" value="0" class="form-control"
                                oninput="this.value = this.value.replace(/[^0-9]/g, '');" placeholder="">
                        </div>
                    </div>
                </div>

                <!-- Daftar Keranjang -->
                <hr>
                <h6>Daftar Barang Keluar</h6>
                <table id="cartTable" class="table table-bordered">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Kode Barang</th>
                            <th>Nama Barang</th>
                            <th>Jumlah</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>

            <div class="modal-footer">
                <button class="btn btn-success" type="button" onclick="addToCart()">Tambah ke Keranjang <i class="fe fe-plus"></i></button>
                <button class="btn btn-primary" type="button" onclick="submitCart()">Proses Semua <i class="fe fe-check"></i></button>
                <a href="javascript:void(0)" class="btn btn-light" onclick="reset()" data-bs-dismiss="modal">Batal <i class="fe fe-x"></i></a>
            </div>
        </div>
    </div>
</div>

@section('formTambahJS')
<script>
    let cart = [];

    function modalBarang() {
        $('#modalBarang').modal('show');
        $('#modaldemo8').addClass('d-none');
        $('input[name="param"]').val('tambah');
        table2.ajax.reload();
    }

    function searchBarang() {
        getbarangbyid($('input[name="kdbarang"]').val());
    }

    function getbarangbyid(id) {
        $.ajax({
            type: 'GET',
            url: "{{ url('admin/barang/getbarang') }}/" + id,
            dataType: 'json',
            success: function(data) {
                if (data.length > 0) {
                    $("#status").val("true");
                    $("#nmbarang").val(data[0].barang_nama);
                } else {
                    $("#status").val("false");
                    $("#nmbarang").val('');
                }
            }
        });
    }

    function addToCart() {
        const kdbarang = $("input[name='kdbarang']").val();
        const nmbarang = $("#nmbarang").val();
        const jml = parseInt($("input[name='jml']").val());

        if (kdbarang === "" || nmbarang === "" || isNaN(jml) || jml <= 0) {
            validasi('Barang dan jumlah wajib diisi!', 'warning');
            return;
        }

        cart.push({ kode: kdbarang, nama: nmbarang, qty: jml });
        renderCart();

        // reset input barang
        $("input[name='kdbarang']").val('');
        $("#nmbarang").val('');
        $("input[name='jml']").val('0');
        $("#status").val('false');
    }

    function renderCart() {
        const tbody = $("#cartTable tbody");
        tbody.empty();
        cart.forEach((item, i) => {
            tbody.append(`
                <tr>
                    <td>${i+1}</td>
                    <td>${item.kode}</td>
                    <td>${item.nama}</td>
                    <td>${item.qty}</td>
                    <td><a href="javascript:void(0)" onclick="removeCart(${i})" class="text-danger">Hapus</a></td>
                </tr>
            `);
        });
    }

    function removeCart(index) {
        cart.splice(index, 1);
        renderCart();
    }

    function submitCart() {
        const bkkode = $("input[name='bkkode']").val();
        const tglkeluar = $("input[name='tglkeluar']").val();
        const tujuan = $("input[name='tujuan']").val();

        if (!tglkeluar || !tujuan || cart.length === 0) {
            validasi('Tanggal, Tujuan, dan Keranjang wajib diisi!', 'warning');
            return;
        }

        $.ajax({
            type: 'POST',
            url: "{{ route('barang-keluar.store') }}",
            data: {
                bkkode: bkkode,
                tglkeluar: tglkeluar,
                tujuan: tujuan,
                barang: cart.map(x => x.kode),
                jml: cart.map(x => x.qty),
            },
            success: function(res) {
                $('#modaldemo8').modal('hide');
                swal({ title: "Berhasil disimpan!", type: "success" });
                table.ajax.reload(null, false);
                reset();
                cart = [];
                renderCart();
            },
            error: function(err) {
                swal({ title: "Gagal!", text: err.responseJSON?.error || "Terjadi kesalahan", type: "error" });
            }
        });
    }

    function reset() {
        $("input[name='bkkode']").val('');
        $("input[name='tglkeluar']").val('');
        $("input[name='tujuan']").val('');
        $("input[name='kdbarang']").val('');
        $("input[name='jml']").val('0');
        $("#nmbarang").val('');
        $("#status").val('false');
        cart = [];
        renderCart();
    }
</script>
@endsection
