<?php

namespace App\Controllers;

use Core\Controller;

class SettingsController extends Controller
{
  public function index()
  {

    return $this->view('settings');
  }

  public function profile()
  {

    return $this->view('profile');
  }
}
