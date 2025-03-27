<?php

extend('app');
section('content');
set_title('Registro');

?>

<div class="p-8">
  <h1 class="text-center text-xl font-semibold mt-4 mb-6 text-gray-800">Cadastro de Lojista</h1>

  <form method="POST" action="/register" class="space-y-6 px-4">
    <?= csrf_field() ?>
    <!-- Personal Data -->
    <div>
      <h2 class="text-lg font-semibold text-gray-900 mb-2">Dados Pessoais</h2>
      <input type="text" name="ownerName" placeholder="Nome do Proprietário" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500" required />
      <input type="text" name="phone" placeholder="Telefone" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500" required />
      <input type="email" name="email" placeholder="E-mail" class="w-full rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500" required />
    </div>

    <!-- Address -->
    <div>
      <h2 class="text-lg font-semibold text-gray-900 mb-2">Endereço</h2>
      <input type="text" name="cep" placeholder="CEP" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500" required />

      <select name="state" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500" required>
        <option value="">Estado</option>
        <?php foreach ($states as $state): ?>
          <option value="<?= $state->id ?>"><?= e($state->name) ?></option>
        <?php endforeach; ?>
      </select>

      <input type="text" name="city" placeholder="Cidade" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500" required />
      <input type="text" name="address" placeholder="Endereço" class="w-full rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500" required />
    </div>

    <!-- Store Information -->
    <div>
      <h2 class="text-lg font-semibold text-gray-900 mb-2">Informações da Loja</h2>

      <select name="category" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500" required>
        <option value="">Especialidade</option>
        <?php foreach ($categories as $category): ?>
          <option value="<?= $category->id ?>"><?= e($category->name) ?></option>
        <?php endforeach; ?>
      </select>

      <input type="text" name="name" placeholder="Nome da Loja" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500" required />
      <input type="number" name="capacity" placeholder="Capacidade de Pessoas" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500" required />
      <input type="number" name="maxPartySize" placeholder="Máximo de pessoas por mesa" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500" required />
      <input type="text" name="cpfCnpj" placeholder="CPF/CNPJ" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500" required />

      <!-- Password -->
      <input type="password" name="password" placeholder="Senha" class="w-full mb-2 rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500" min="6" required />

    </div>

    <!-- Buttons -->
    <div class="pt-4 space-y-2">
      <button type="submit" class="w-full bg-orange-500 hover:bg-orange-600 text-white py-3 rounded font-semibold transition">Cadastrar</button>
      <a href="/login" class="w-full block text-center border-2 border-orange-500 text-orange-600 py-3 rounded font-semibold hover:bg-orange-50 transition">Entrar no Portal</a>
    </div>
  </form>
</div>

<?php endSection(); ?>