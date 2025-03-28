<?php

namespace App\Controllers\Api;

use Core\Controller;
use Core\Database;
use Core\Exceptions;
use Core\Request;
use Core\Validator;
use Core\Response;
use PDO;

class UserController extends Controller
{
  public function register()
  {

    $request = Request::all();
    $db = Database::connection();


    Validator::requireFields($request, [
      'name',
      'email',
      'cpf',
      'password',
    ]);

    $exists = $db->prepare("SELECT * FROM Users WHERE email = ? OR cpfCnpj = ?");
    $exists->execute([$request['email'], $request['cpf']]);
    $exists = $exists->fetch();

    if ($exists) {
      Response::exception(Exceptions::USER_ALREADY_EXISTS);
    }

    $password = password_hash($request['password'], PASSWORD_DEFAULT);

    $stmt = $db->prepare("INSERT INTO Users (name, email, cpfCnpj, password) VALUES (?, ?, ?, ?)");
    $stmt->execute([$request['name'], $request['email'], $request['cpf'], $password]);

    Response::json("User created successfully");
  }

  public function login()
  {

    $request = Request::all();
    $db = Database::connection();

    Validator::requireFields($request, [
      'email',
      'password',
    ]);

    $user = $db->prepare("SELECT * FROM Users WHERE email = ?");
    $user->execute([$request['email']]);
    $user = $user->fetchAll(PDO::FETCH_ASSOC)[0];

    if (!$user) {
      Response::exception(Exceptions::USER_NOT_FOUND);
    }

    if (!password_verify($request['password'], $user['password'])) {
      Response::exception(Exceptions::INVALID_PASSWORD);
    }

    // $token = bin2hex(random_bytes(32));

    Response::json(
      "Login Success",
      [
        'account' => $user,
      ]
    );
  }
}
