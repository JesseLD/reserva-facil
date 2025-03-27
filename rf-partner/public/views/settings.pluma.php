<?php

extend('auth');
section('content');
set_title('Perfil');

/**
 * Customer
 * date
 * partySize
 * status
 * id
 * 
 */
?>

<section class="">
  <div class="bg-white shadow rounded-lg p-4 w-full flex gap-4 mb-8">
    <a href="/settings">
      <h2 class="text-2xl font-semibold text-orange-600 underline cursor-pointer">Configurações</h2>
    </a>
    <span class="text-2xl font-semibold text-gray-800"> - </span>
    <a href="/settings/profile">
      <h2 class="text-2xl font-semibold text-gray-800 hover:text-orange-600 hover:underline cursor-pointer">Perfil</h2>
    </a>

  </div>

  <form method="POST" action="/settings" class="space-y-6 px-4">
    <?= csrf_field() ?>
    <!-- Personal Data -->

    <div>
      <h2 class="text-xl font-semibold text-gray-900 mb-4">Horários de Funcionamento</h2>

      <!-- Table Header -->
      <div class="grid grid-cols-5 gap-4 items-center mb-2 font-medium text-gray-700">
        <span>Dia da Semana</span>
        <span>Horário de Abertura</span>
        <span>Horário de Fechamento</span>
        <span>Status</span>
        <span class="text-sm text-gray-400">(Obrigatórios)</span>
      </div>

      <!-- Horários -->
      <?php $days = ['Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo']; ?>
      <?php foreach ($days as $day): ?>
        <div class="grid grid-cols-5 gap-4 items-center mb-2">
            <input type="hidden" name="weekDay" value="<?= array_search($day, $days) ?>">
          <p class="text-base font-medium text-gray-800">
            <?= $day ?>
          </p>
          <input type="time" name="<?= strtolower($day) ?>Opening" required
            class="w-full rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500 outline-none">
          <input type="time" name="<?= strtolower($day) ?>Close" required
            class="w-full rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500 outline-none">
          <label class="flex items-center gap-2 text-sm text-gray-700">
            <input type="checkbox" name="<?= strtolower($day) ?>Active" value="1" class="accent-orange-500">
            Fechado
          </label>
          <span></span>
        </div>
      <?php endforeach; ?>
    </div>

    <hr class="my-4">

    <div>
      <h2 class="text-xl font-semibold text-gray-900 mb-4">Integrações</h2>
      <h3 class="text-md font-semibold text-gray-900 mb-2">Google Maps</h3>
      <input type="text" name="googleMapsUrl" placeholder="Endereço Google Maps" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500 outline-none" required />

    </div>

    <!-- Buttons -->
    <div class="pt-4 flex ">
      <button type="submit" class=" bg-orange-500 hover:bg-orange-600 text-white py-3 rounded font-semibold transition px-6 ">Salvar</button>
    </div>
  </form>

</section>

<?php endSection(); ?>