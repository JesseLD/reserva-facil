<?php

namespace App\Controllers;

use Core\Auth;
use Core\Controller;
use Core\Database;
use Core\Request;
use PDO;

class ProductsController extends Controller
{
  public function index()
  {
    $request = Request::all();
    $db = Database::connection();
    $id = Auth::user()['id'];


    $stmt = $db->prepare("SELECT * FROM Products WHERE storeId = ?");
    $stmt->execute([$id]);
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

    return $this->view('products',[
      'products' => $products
    ]);
  }

  // public function show()
  // {

  //   return $this->view('product');
  // }

  public function store()
  {
    $request = Request::all();
    $db = Database::connection();
    $id = Auth::user()['id'];

    $name = $request['name'];
    $price = $request['price'];
    $description = $request['description'];

    $stmt = $db->prepare("INSERT INTO Products (name, price, description, storeId) VALUES (?, ?, ?, ?)");
    $stmt->execute([$name, $price, $description, $id]);

    return $this->redirect('/products');

    // return $this->view('create-product');
  }

  public function remove($id)

  {
    $db = Database::connection();
  

    $stmt = $db->prepare("DELETE FROM Products WHERE id = ?");
    $stmt->execute([$id]);

    return $this->redirect('/products');
  }
}
