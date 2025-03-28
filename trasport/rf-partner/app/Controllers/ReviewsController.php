<?php

namespace App\Controllers;

use Core\Controller;

class ReviewsController extends Controller
{
  public function index()
  {

    return $this->view('reviews');
  }
}
