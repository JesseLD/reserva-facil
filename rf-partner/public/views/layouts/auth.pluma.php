<?php

use Core\Auth;
use Core\View; ?>
<!DOCTYPE html>
<html lang="en">
<?= include_partial('head'); ?>

<?php

$success = get_success_flash();
$error = get_error_flash();

$storeName = Auth::user()['name'];

?>

<body class="bg-slate-100 min-h-screen flex">

  <!-- Sidebar -->
  <aside class="w-64 bg-white shadow-md">
    <div class="px-6 py-4 text-center border-b">
      <h2 class="text-lg font-semibold text-gray-800">
        <img src="<?= asset("images/light.svg") ?>" alt="" width="140" class="pointer-events-none">
      </h2>
    </div>
    <nav class="px-4 py-6 space-y-2">
      <a href="/home" class="flex items-center px-3 py-2 rounded hover:bg-gray-100 transition">
        <ion-icon class="mr-3" name="speedometer-outline"></ion-icon> Dashboard

      </a>
      <a href="/reservations" class="flex items-center px-3 py-2 rounded hover:bg-gray-100 transition">
        <ion-icon class="mr-3" name="calendar-outline"></ion-icon> Reservas

      </a>
      <a href="/products" class="flex items-center px-3 py-2 rounded hover:bg-gray-100 transition">
        <ion-icon class="mr-3" name="cube-outline"></ion-icon> Produtos
      </a>

      <a href="/settings/profile" class="flex items-center px-3 py-2 rounded hover:bg-gray-100 transition">
        <ion-icon class="mr-3" name="person-outline"></ion-icon> Perfil
      </a>
      <a href="/reviews" class="flex items-center px-3 py-2 rounded hover:bg-gray-100 transition">
        <ion-icon class="mr-3" name="star-outline"></ion-icon> Avaliações
      </a>
      <!-- <a href="#" class="flex items-center px-3 py-2 rounded hover:bg-gray-100 transition">
        <ion-icon class="mr-3" name="stats-chart-outline"></ion-icon> Relatórios
      </a> -->
      <a href="/settings" class="flex items-center px-3 py-2 rounded hover:bg-gray-100 transition">
        <ion-icon class="mr-3" name="settings-outline"></ion-icon> Configurações
      </a>
      <a href="/logout" class="flex items-center px-3 py-2 rounded hover:bg-gray-100 transition">
        <ion-icon class="mr-3" name="log-out-outline"></ion-icon> Sair
      </a>
    </nav>
  </aside>

  <!-- Main Content -->
  <div class="flex-1">
    <header class="bg-orange-500 py-4 shadow-md">
      <div class="container mx-auto px-4">
        <h1 class="text-white text-2xl font-semibold">Painel - <?= $storeName ?></h1>
      </div>
    </header>

    <main class="container mx-auto px-4 py-8">

      <!-- Main Content Section -->
      <?php View::section('content'); ?>

    </main>
  </div>

  <?= include_partial('end'); ?>
</body>

</html>