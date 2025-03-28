<?php

namespace App\Controllers\Api;

use App\Services\Http;
use Core\Request;
use Core\Controller;
use Core\Database;
use Core\Response;
use Core\Validator;
use PDO;

class ReservationController extends Controller
{

  public function index($id)
  {
    $data = Request::all();
    $db = Database::connection();

    $stmt = $db->prepare("SELECT 
        r.id AS reservationNumber,
        DATE_FORMAT(r.date, '%d/%m/%Y %H:%i') AS date,
        s.id AS restaurantId,
        s.name AS restaurantName,
        UPPER(r.status) AS status,
        r.partySize AS numberOfPeople,
        5 AS rating
      FROM 
        Reservation r
      JOIN Store s ON s.id = r.storeId
      LEFT JOIN Reviews rv ON rv.reservationId = r.id
      WHERE 
        r.userId = ? -- Substitua pelo ID do usuário
      ORDER BY 
        r.date DESC;
      ");
    $stmt->execute([$id]);
    $reservations = $stmt->fetchAll(PDO::FETCH_ASSOC);

   


   foreach ($reservations as $key => $reservation) {
    $restaurantStmt = $db->prepare("SELECT 
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
  WHERE 
    s.id = ?
  GROUP BY 
    s.id, s.name, sc.name;");

    $restaurantStmt->execute([$reservation['restaurantId']]);
    $restaurant = $restaurantStmt->fetch(PDO::FETCH_ASSOC);


    $reservations[$key]['restaurant'] = $restaurant;
    }
    


    return Response::json("Reservations Fetch", $reservations);
  }
  public function store()
  {

    $mailURL = "http://127.0.0.1:3030/email";
    $apiKey = "RFAPP_012025_DEV";

    $data = Request::all();
    $db = Database::connection();

    Validator::requireFields($data, [
      'storeId',
      'userId',
      'partySize',
      'date',
    ]);


    $stmt = $db->prepare("INSERT INTO Reservation 
    (storeId, userId, partySize, date, status, observation) 
    VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->execute([$data['storeId'], $data['userId'], $data['partySize'], $data['date'], 'pending', $data['observation']]);


    $storeStmt = $db->prepare("SELECT * FROM Store WHERE id = ?");
    $storeStmt->execute([$data['storeId']]);
    $store = $storeStmt->fetch(PDO::FETCH_ASSOC);


    $userStmt = $db->prepare("SELECT * FROM Users WHERE id = ?");
    $userStmt->execute([$data['userId']]);
    $user = $userStmt->fetch(PDO::FETCH_ASSOC);

    $date = date('d/m/Y', strtotime($data['date']));
    $time = date('H:i', strtotime($data['date']));
    // {
    //   "target": "jesseluis120@gmail.com",
    //   "subject": "Sua reserva está aguardando confirmação",
    //   "name": "João Silva",
    //   "date": "10/12/2024",
    //   "time": "19:30",
    //   "people": 2,
    //   "restaurant": "Restaurante Sabor & Arte",
    //   "observations": "Mesa próxima à janela, se possível.",
    //   "type": "pending"
    // }
    $postData = [
      'target' => $user['email'],
      'subject' => 'Sua reserva está aguardando confirmação',
      'name' => $user['name'],
      'date' => $date,
      'time' => $time,
      'people' => $data['partySize'],
      'restaurant' => $store['name'],
      'observations' => $data['observations'] ?? '',
      'type' => 'pending'
    ];

    $ch = curl_init($mailURL);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
      'Content-Type: application/json',
      'Authorization:' . $apiKey
    ]);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postData));

    // Caso seu servidor local não use HTTPS:
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);

    $response = curl_exec($ch);

    if (curl_errno($ch)) {
      $error = curl_error($ch);
      curl_close($ch);
      // você pode logar ou lançar uma exceção aqui
      return Response::json("Erro ao enviar email: $error",);
    }

    curl_close($ch);

    // // Se quiser, pode decodificar a resposta
    $responseData = json_decode($response, true);

    // Http::withHeaders(
    //   [
    //     "Authorization" => $apiKey
    //   ]
    // )->post($mailURL, [
    //   'target' => $user['email'],
    //   'subject' => 'Sua reserva está aguardando confirmação',
    //   'name' => $user['name'],
    //   'date' => $date,
    //   'time' => $time,
    //   'people' => $data['partySize'],
    //   'restaurant' => $store['restaurant'],
    //   'observations' => $data['observations'],
    //   'type' => 'pending'
    // ]); 


    return Response::json("Reservation created", ['status' => 'pending', 'reservation' => $responseData]);
  }
}
