<?php

namespace App\Controllers\Auth;

use Core\Auth;
use Core\Controller;
use Core\Database;
use Core\Request;
use Core\Session;

class LoginController extends Controller
{
  public function index()
  {
    return $this->view('shopkeepers.login');
  }

  public function login()
  {
    // Handle POST to login
    $request = Request::all();
    $db = Database::connection();

    $email = $request['email'];
    $password = $request['password'];

    $stmt = $db->prepare("SELECT * FROM shopkeepers WHERE email = ?");
    $stmt->execute([$email]);
    $shopkeeper = $stmt->fetch();

    if ($shopkeeper && password_verify($password, $shopkeeper['password'])) {
      Auth::login($shopkeeper);
      return $this->redirect('/home');
    } else {
      return $this->redirect('/login');
    }
  }
}
