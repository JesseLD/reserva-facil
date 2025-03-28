<?php

extend('auth');
section('content');
set_title('Produtos');

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
    <h2 class="text-2xl font-semibold text-gray-800">Produtos</h2>
    <button type="submit"
      class="px-4 bg-orange-500 hover:bg-orange-600 text-white py-2 rounded font-semibold transition"
      data-modal-target="popup-modal" data-modal-toggle="popup-modal">
      Adicionar
    </button>
  </div>

  <div id="popup-modal" tabindex="-1" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
    <div class="relative p-4 w-full max-w-md max-h-full">


      <div class="relative bg-white rounded-lg shadow-sm">
        <button type="button" class="absolute top-3 end-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center" data-modal-hide="popup-modal">
          <ion-icon name="close-outline" class="text-gray-700 text-2xl"></ion-icon>
          <span class="sr-only">Close modal</span>
        </button>

        <form method="POST" action="/products">
          <div class="p-4 md:p-5 text-center flex flex-col gap-4">
            <h2 class="text-3xl font-semibold text-gray-800">Novo Produto</h2>
            <input type="name" name="name" placeholder="Nome do produto" class="w-full rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500 outline-none" required />
            <input type="text" name="description" placeholder="Descrição (Opcional)" class="w-full rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500 outline-none" />
            <input type="number" step="0.01" name="price" placeholder="Valor" class="w-full rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500 outline-none" required />
            <div class="flex">
              <button type="submit"
                class="px-4 bg-orange-500 hover:bg-orange-600 text-white py-2 rounded font-semibold transition">
                Adicionar
              </button>
            </div>
          </div>
        </form>

      </div>

    </div>
  </div>



  <ul class="w-full divide-y divide-gray-200  grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3">

    <?php foreach ($products as $product): ?>
      <li class="w-full max-w-md mb-3 sm:mb-4 p-3 shadow sm:rounded-lg sm:divide-y-0 sm:divide-x  bg-white">
        <div class="flex items-center space-x-4 rtl:space-x-reverse">

          <div class="flex-1 min-w-0">
            <p class="text-sm font-medium text-gray-900 truncate ">
              <?= e($product["name"]) ?>
            </p>
            <p class="text-sm text-gray-500 truncate dark:text-gray-400">
              <?= e($product["description"]) ?>
            </p>
          </div>
          <div class="inline-flex items-center text-base font-semibold text-gray-900 ">
            R$ <?= e($product["price"]) ?>
          </div>


          <ion-icon id="<?= "dropdownDefaultButton" . $product["id"] ?>" data-dropdown-toggle="<?= "dropdown" . $product["id"] ?>" name="ellipsis-vertical"></ion-icon>

          <!-- Dropdown menu -->
          <div id="<?= "dropdown" . $product["id"] ?>" class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow-sm px-2 py-2">
            <ul class=" text-sm text-gray-700 " aria-labelledby="<?= "dropdownDefaultButton" . $product["id"] ?>">
              <a href="/products/remove/<?= $product["id"] ?>">
                <li class="block p-2 px-4 hover:bg-gray-100 rounded-md">
                  Remover
                </li>
              </a>

            </ul>
          </div>

        </div>
      </li>
    <?php endforeach; ?>

  </ul>







</section>

<?php endSection(); ?>