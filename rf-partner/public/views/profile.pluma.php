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
      <h2 class="text-2xl font-semibold text-gray-800 hover:text-orange-600 hover:underline cursor-pointer">Configurações</h2>
    </a>
    <span class="text-2xl font-semibold text-gray-800"> - </span>
    <a href="/settings/profile">
      <h2 class="text-2xl font-semibold text-orange-600 underline cursor-pointer">Perfil</h2>
    </a>

  </div>

  <div class="flex flex-col gap-4">
    <div>
      <h2 class="text-lg font-semibold text-gray-900 mb-2">Dados Pessoais</h2>
      <input type="text" name="ownerName" placeholder="Nome do Proprietário" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500 outline-none" required readonly />
      <input type="text" name="phone" placeholder="Telefone" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500 outline-none" required readonly />
      <input type="email" name="email" placeholder="E-mail" class="w-full rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500 outline-none" required readonly />
    </div>
    <!-- Address -->
    <div>
      <h2 class="text-lg font-semibold text-gray-900 mb-2">Endereço</h2>
      <input type="text" name="cep" placeholder="CEP" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500 outline-none" required readonly />
      <input type="text" name="state" placeholder="Estado" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500 outline-none" required readonly />
      <input type="text" name="city" placeholder="Cidade" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500 outline-none" required readonly />
      <input type="text" name="address" placeholder="Endereço" class="w-full rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500 outline-none" required readonly />
    </div>
    <!-- Store Information -->
    <div>
      <h2 class="text-lg font-semibold text-gray-900 mb-2">Informações da Loja</h2>
      <input type="text" name="category" placeholder="Especialidade" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500 outline-none" required readonly />
      <input type="text" name="name" placeholder="Nome da Loja" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500 outline-none" required readonly />
      <input type="number" name="capacity" placeholder="Capacidade de Pessoas" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500 outline-none" required readonly />
      <input type="number" name="maxPartySize" placeholder="Máximo de pessoas por mesa" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500 outline-none" required readonly />
      <input type="text" name="cpfCnpj" placeholder="CPF/CNPJ" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500 outline-none" required readonly />
    </div>
  </div>

</section>

<?php endSection(); ?>