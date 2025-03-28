<?php

use App\Controllers\Api\ReservationController;
use App\Controllers\Api\StoreController;
use App\Controllers\Api\UserController;
use Core\Router;


// API ROUTES (no csrf, no authentication required, api key required)
$router->group('ApiKeyMiddleware', function ($router) {
  // $router->get('/api/users', [UserController::class, 'index']);




  // User

  $router->post('/api/register', [UserController::class, 'register']);
  $router->post('/api/login', [UserController::class, 'login']);

  $router->get('/api/stores/list', [StoreController::class, 'index']);
  $router->get('/api/stores/{id}', [StoreController::class, 'show']);


  $router->post('/api/reservation', [ReservationController::class, 'store']);
  $router->get('/api/reservation/{id}', [ReservationController::class, 'index']);
});