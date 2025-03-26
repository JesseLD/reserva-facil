<?php

extend('app');
section('content');
set_title('Login');

?>

<div class="p-8 flex justify-center items-center min-h-screen">
  <div class="bg-white shadow-md rounded-lg p-8 max-w-md w-full">

    <h2 class="text-2xl font-semibold text-gray-800 mb-6 text-center">Login</h2>

    <form method="POST" action="/login" class="space-y-4">
      <!-- CSRF Protection -->
      <?= csrf_field() ?>

      <!-- Email Input -->
      <div>
        <label class="block text-gray-700 mb-1" for="email">Email</label>
        <input type="email" id="email" name="email" required
          class="w-full rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500">
      </div>

      <!-- Password Input -->
      <div>
        <label class="block text-gray-700 mb-1" for="password">Senha</label>
        <input type="password" id="password" name="password" required
          class="w-full rounded border border-gray-300 px-4 py-2 focus:ring-orange-500 focus:border-orange-500">
      </div>

      <!-- Login Button -->
      <button type="submit"
        class="w-full bg-orange-500 hover:bg-orange-600 text-white py-2 rounded font-semibold transition">
        Entrar
      </button>

      <!-- Register Link -->
      <p class="text-center text-gray-600">
        Não possui uma conta?
        <a href="/register" class="text-orange-500 hover:underline">Cadastre-se</a>
      </p>

    </form>

  </div>
</div>

<?php endSection(); ?>