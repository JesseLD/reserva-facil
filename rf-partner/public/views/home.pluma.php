<?php


extend('app');
section('content');
set_title('Welcome');

?>


<!-- Header -->
<header class="bg-gradient-to-r from-orange-500 to-yellow-400 p-4 flex items-center justify-between">
  <div class="flex items-center space-x-2">
    <div class="bg-white text-orange-600 font-bold rounded-full w-8 h-8 flex items-center justify-center">R</div>
    <span class="text-white text-lg font-semibold">Reserva Fácil</span>
  </div>
  <nav class="space-x-4">
    <a href="#como-funciona" class="text-white hover:underline">Como Funciona</a>
    <a href="#sobre" class="text-white hover:underline">Sobre</a>
    <a href="/login" class="bg-white text-orange-600 px-4 py-1 rounded-lg font-medium hover:bg-orange-100">Entrar</a>
  </nav>
</header>

<!-- Hero -->
<section class="text-center py-12 px-4 bg-gray-100">
  <h1 class="text-3xl md:text-4xl font-extrabold text-orange-600 mb-2">Descubra os melhores restaurantes em todo o Brasil.</h1>
  <p class="text-gray-700 text-lg mb-6 max-w-2xl mx-auto">Mais de 1 milhão de pessoas já aproveitaram experiências de primeira em mais de 5 mil restaurantes espalhados por todo o Brasil!</p>

  <div class="relative max-w-4xl mx-auto overflow-hidden rounded-2xl shadow-lg">
    <img src="/assets/banner-restaurante.jpg" alt="Restaurante" class="w-full h-64 object-cover opacity-90">
    <div class="absolute inset-0 bg-black bg-opacity-40 flex flex-col items-center justify-center text-white text-center px-4">
      <h2 class="text-2xl md:text-3xl font-bold">Encontre o restaurante ideal para você</h2>
      <p class="mt-2 max-w-lg">Seja para um jantar romântico, um almoço de negócios ou um encontro com os amigos, o Reserva Fácil tem o lugar perfeito para você!</p>
      <a href="/restaurantes" class="mt-4 bg-orange-500 hover:bg-orange-600 text-white font-semibold px-6 py-2 rounded-lg transition">Conheça os Restaurantes</a>
    </div>
  </div>

  <div class="mt-10">
    <a href="/cadastro-restaurante" class="inline-block bg-white border-2 border-orange-500 text-orange-600 font-semibold px-6 py-3 rounded-lg hover:bg-orange-50 transition">
      Cadastre seu Restaurante
    </a>
  </div>
</section>

<!-- Footer simples -->
<footer class="text-center text-sm text-gray-500 py-6">
  &copy; 2025 Reserva Fácil. Todos os direitos reservados.
</footer>

<?php endSection(); ?>