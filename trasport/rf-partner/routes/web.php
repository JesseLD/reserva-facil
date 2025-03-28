<?php

use App\Controllers\HomeController;
use App\Controllers\Auth\LoginController;
use App\Controllers\ProductsController;
use App\Controllers\ReservationController;
use App\Controllers\ReviewsController;
use App\Controllers\SettingsController;
use App\Controllers\ShopkeeperController;
use Core\Router;


// PUBLIC ROUTES (csrf, no authentication required)
$router->group('VerifyCsrfToken', function ($router) {

  $router->get('/', function () {
    redirect('/login');
  });

  $router->get('/register', [ShopkeeperController::class, 'create']);
  $router->post('/register', [ShopkeeperController::class, 'store']);
  // $router->group('VerifyCsrfToken', function ($router) {
  // });
  // $router->get('/welcome', [HomeController::class, 'index']);
  $router->get('/login', [LoginController::class, 'index']);

  $router->post('/login', [LoginController::class, 'login']);


  // AUTHENTICATED ROUTES (csrf, authentication required)
  $router->group('AuthMiddleware', function ($router) {
    $router->get('/home', [HomeController::class, 'index']);
    $router->get('/logout', [LoginController::class, 'logout']);

    // Reservations
    $router->get('/reservations', [ReservationController::class, 'index']);
    $router->get('/reservations/cancel/{id}', [ReservationController::class, 'cancel']);
    $router->get('/reservations/confirm/{id}', [ReservationController::class, 'confirm']);

    // Products
    $router->get('/products', [ProductsController::class, 'index']);
    $router->post('/products', [ProductsController::class, 'store']);
    $router->get('/products/remove/{id}', [ProductsController::class, 'remove']);


    // Settings
    $router->get('/settings', [SettingsController::class, 'index']);
    $router->get('/settings/profile', [SettingsController::class, 'profile']);

    // Reviews
    $router->get('/reviews', [ReviewsController::class, 'index']);
   
  });
});


// API ROUTES (no csrf, no authentication required, api key required)

require_once 'api.php';







