<?php

use App\Controllers\HomeController;
use App\Controllers\Auth\LoginController;
use App\Controllers\ShopkeeperController;
use Core\Router;


// PUBLIC ROUTES (csrf, no authentication required)
$router->group('VerifyCsrfToken', function ($router) {

  $router->get('/', function () {
    redirect('/login');
  });

  $router->get('/register', [ShopkeeperController::class, 'create']);
  // $router->group('VerifyCsrfToken', function ($router) {
  // });
  // $router->get('/welcome', [HomeController::class, 'index']);
  $router->get('/login', [LoginController::class, 'index']);

  $router->post('/login', [LoginController::class, 'login']);


  // AUTHENTICATED ROUTES (csrf, authentication required)
  $router->group('AuthMiddleware', function ($router) {
    // $router->get('/home', [DashboardController::class, 'index']);
  });
});







