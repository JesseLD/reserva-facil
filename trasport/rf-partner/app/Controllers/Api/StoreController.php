<?php

namespace App\Controllers\Api;

use Core\Request;
use Core\Controller;
use Core\Database;
use Core\Response;
use PDO;

class StoreController extends Controller
{
  public function index()
  {
    $data = Request::all();
    $db = Database::connection();

    $payload = [];

    $stmt = $db->prepare("SELECT 
  s.id,
  s.name AS name,
  5 AS rating,
  sc.name AS category,
  MIN(p.price) AS priceRangeStart,
  MAX(p.price) AS priceRangeEnd,
  s.capacity AS capacity
FROM 
  Store s
LEFT JOIN Reviews r ON r.storeId = s.id
LEFT JOIN Products p ON p.storeId = s.id
LEFT JOIN StoreCategories sc ON sc.id = s.categoryId
GROUP BY 
  s.id, s.name, sc.name;
");
    $stmt->execute();
    $stores = $stmt->fetchAll(PDO::FETCH_ASSOC);


    return Response::json("Stores Fetch",$stores);
   
  }
  public function show($id)
  {
    $data = Request::all();
    $db = Database::connection();

   

    $products = $db->prepare("SELECT * FROM Products WHERE storeId = ?");
    $products->execute([$id]);
    $products = $products->fetchAll(PDO::FETCH_ASSOC);

    $openingHours = $db->prepare("SELECT * FROM OpeningTimes WHERE storeId = ?");
    $openingHours->execute([$id]);
    $openingHours = $openingHours->fetchAll(PDO::FETCH_ASSOC);

    $store = $db->prepare("SELECT * FROM Store WHERE id = ?");
    $store->execute([$id]);
    $store = $store->fetch(PDO::FETCH_ASSOC);

    

    $store['products'] = $products;
    $store['openingHours'] = $openingHours;
    $store['rating'] = 4.5;



    return Response::json("Stores Fetch",$store);
   
  }
}
