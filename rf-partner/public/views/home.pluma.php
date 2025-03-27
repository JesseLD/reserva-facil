<?php

use Core\Auth;

extend('auth');
section('content');
set_title('Home');

$userName = Auth::user()['ownerName'];

?>

<section class="mb-8">

  <div class="bg-white shadow rounded-lg p-4">
    <p>Bem Vindo 👋</p>
    <h1 class="text-3xl font-semibold text-gray-800"><?= $userName ?></h1>
  </div>

</section>

<!-- Dashboard Cards -->
<section class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">

  <div class="bg-white shadow rounded-lg p-4">
    <h2 class="text-gray-500">Reservas Hoje</h2>
    <p class="text-3xl font-bold text-gray-800">12</p>
  </div>

  <div class="bg-white shadow rounded-lg p-4">
    <h2 class="text-gray-500">Total de Reservas</h2>
    <p class="text-3xl font-bold text-gray-800">220</p>
  </div>

  <div class="bg-white shadow rounded-lg p-4">
    <h2 class="text-gray-500">Ocupação Atual</h2>
    <p class="text-3xl font-bold text-gray-800">65%</p>
  </div>

  <div class="bg-white shadow rounded-lg p-4">
    <h2 class="text-gray-500">Reservas Pendentes</h2>
    <p class="text-3xl font-bold text-gray-800">3</p>
  </div>

</section>

<!-- Recent Reservations Table -->
<section class="bg-white shadow rounded-lg p-6">
  <h2 class="text-xl font-semibold mb-4">Próximas Reservas</h2>

  <table class="min-w-full divide-y divide-gray-200">
    <thead>
      <tr class="text-left">
        <th class="py-2 px-3">Cliente</th>
        <th class="py-2 px-3">Data/Hora</th>
        <th class="py-2 px-3">Qtd. Pessoas</th>
        <th class="py-2 px-3">Status</th>
      </tr>
    </thead>
    <tbody class="divide-y divide-gray-200">
      <tr>
        <td class="py-2 px-3">Ana Silva</td>
        <td class="py-2 px-3">2025-03-27 19:00</td>
        <td class="py-2 px-3">4</td>
        <td class="py-2 px-3"><span class="bg-green-200 text-green-800 py-1 px-2 rounded">Confirmado</span></td>
      </tr>
      <tr>
        <td class="py-2 px-3">Pedro Gomes</td>
        <td class="py-2 px-3">2025-03-27 20:30</td>
        <td class="py-2 px-3">2</td>
        <td class="py-2 px-3"><span class="bg-yellow-200 text-yellow-800 py-1 px-2 rounded">Pendente</span></td>
      </tr>
      <tr>
        <td class="py-2 px-3">Maria Lima</td>
        <td class="py-2 px-3">2025-03-27 21:00</td>
        <td class="py-2 px-3">6</td>
        <td class="py-2 px-3"><span class="bg-green-200 text-green-800 py-1 px-2 rounded">Confirmado</span></td>
      </tr>
    </tbody>
  </table>
</section>




<?php endSection(); ?>