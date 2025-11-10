@extends('Master.Layouts.app', ['title' => $title])

@section('content')
<!-- PAGE-HEADER -->
<div class="page-header">
    <h1 class="page-title">Dashboard</h1>
</div>
<!-- PAGE-HEADER END -->


 <!-- KANAN: Jam Digital Futuristik -->
 <div class="text-end" style="flex:1;">
                <h1 id="clock" class="mb-1" style="
                    font-family: 'Orbitron', sans-serif;
                    font-size: 3rem;
                    letter-spacing: 2px;
                    color:rgb(0, 0, 0);
                "></h1>
                <p id="date" class="fs-6 mb-0" style="color:rgb(0, 0, 0);"></p>
            </div>
<!-- WELCOME SECTION FUTURISTIK -->
<div class="row mb-4">
    <div class="col-12">
        <div class="card shadow-lg p-4 d-flex justify-content-between align-items-center" style="
            background: linear-gradient(135deg,rgb(255, 159, 81),rgb(255, 238, 215));
            color: white;
            border-radius: 20px;
        ">
            <!-- KIRI: Selamat Datang -->
            <div class="text-start" style="flex:1;">
                <h2 class="fw-bold mb-1" style="font-family: 'Segoe UI', sans-serif; font-size: 2rem;">
                    Selamat Datang, {{ Auth::user()->name ?? 'User' }}
                </h2>
            </div>

           
        </div>
    </div>
</div>

<!-- STATISTICS CARDS (sama seperti sebelumnya) -->
  

<!-- DOUGHNUT CHART (GABUNGAN) -->
<div class="row mb-4">
    <div class="col-12 d-flex justify-content-center">
        <div class="card shadow-sm p-4" style="max-width:600px; width:100%;">
            <h3 class="mb-3 text-center">Distribusi Barang</h3>
            <div class="d-flex justify-content-center">
                <canvas id="pieChart" style="width:100%; max-width:400px;"></canvas>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    // DOUGHNUT CHART (GABUNGAN)
    const ctx = document.getElementById('pieChart').getContext('2d');
    const data = {
        labels: ['Barang Masuk', 'Barang Keluar'],
        datasets: [{
            label: 'Jumlah',
            data: [{{ $bm ?? 0 }}, {{ $bk ?? 0 }}],
            backgroundColor: ['#00008B', '#FF8C00'],
            borderWidth: 0
        }]
    };
    const config = {
        type: 'doughnut',
        data: data,
        options: {
            cutout: '70%', // bikin bolong tengah
            responsive: true,
            plugins: {
                legend: { position: 'bottom' },
                tooltip: { enabled: true }
            }
        }
    };
    new Chart(ctx, config);
});
</script>



<!-- SCRIPT -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    // JAM & TANGGAL
    function updateClock() {
        const now = new Date();
        const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
        document.getElementById('date').textContent = now.toLocaleDateString('id-ID', options);
        const hours = String(now.getHours()).padStart(2,'0');
        const minutes = String(now.getMinutes()).padStart(2,'0');
        const seconds = String(now.getSeconds()).padStart(2,'0');
        document.getElementById('clock').textContent = `${hours}:${minutes}:${seconds}`;
    }
    setInterval(updateClock, 1000);
    updateClock();

    
});
</script>

<!-- OPTIONAL: Import font Orbitron untuk jam futuristik -->
<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500;700&display=swap" rel="stylesheet">
@endsection
