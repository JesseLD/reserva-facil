<?php

namespace App\Controllers;

use Core\Auth;
use Core\Controller;
use Core\Database;
use Core\Response;
use PDO;

class ReservationController extends Controller
{

  public function cancel($id)
  {
    $db = Database::connection();

    $mailURL = "http://127.0.0.1:3030/email";
    $apiKey = "RFAPP_012025_DEV";
    

    $stmt = $db->prepare("SELECT * FROM Reservation WHERE id = ?");
    $stmt->execute([$id]);
    $reservation = $stmt->fetch(PDO::FETCH_ASSOC);

    $user = $db->prepare("SELECT * FROM Users WHERE id = ?");
    $user->execute([$reservation['userId']]);
    $user = $user->fetch(PDO::FETCH_ASSOC);

    $store = $db->prepare("SELECT * FROM Store WHERE id = ?");
    $store->execute([$reservation['storeId']]);
    $store = $store->fetch(PDO::FETCH_ASSOC);

    $date = date('d/m/Y', strtotime($reservation['date']));
    $time = date('H:i', strtotime($reservation['date']));

    $partySize = $reservation['partySize'];

    $observations = $reservation['observations'];

    $postData = [
      'target' => $user['email'],
      'subject' => 'Sua reserva está aguardando confirmação',
      'name' => $user['name'],
      'date' => $date,
      'time' => $time,
      'people' => $partySize,
      'restaurant' => $store['name'],
      'observations' => $observations ?? '',
      'type' => 'cancel'
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

    $stmt = $db->prepare("DELETE FROM Reservation WHERE id = ?");
    $stmt->execute([$id]);

    // // Se quiser, pode decodificar a resposta
    $responseData = json_decode($response, true);

    return redirect('/reservations');
  }

  public function confirm($id)
  {
    $db = Database::connection();

    $mailURL = "http://127.0.0.1:3030/email";
    $apiKey = "RFAPP_012025_DEV";
    

    $stmt = $db->prepare("SELECT * FROM Reservation WHERE id = ?");
    $stmt->execute([$id]);
    $reservation = $stmt->fetch(PDO::FETCH_ASSOC);

    $user = $db->prepare("SELECT * FROM Users WHERE id = ?");
    $user->execute([$reservation['userId']]);
    $user = $user->fetch(PDO::FETCH_ASSOC);

    $store = $db->prepare("SELECT * FROM Store WHERE id = ?");
    $store->execute([$reservation['storeId']]);
    $store = $store->fetch(PDO::FETCH_ASSOC);

    $date = date('d/m/Y', strtotime($reservation['date']));
    $time = date('H:i', strtotime($reservation['date']));

    $partySize = $reservation['partySize'];
    $observations = $reservation['observations'];


    $postData = [
      'target' => $user['email'],
      'subject' => 'Sua reserva está aguardando confirmação',
      'name' => $user['name'],
      'date' => $date,
      'time' => $time,
      'people' => $partySize,
      'restaurant' => $store['name'],
      'observations' => $observations ?? '',
      'type' => 'confirm'
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

    $stmt = $db->prepare("UPDATE Reservation SET status = 'confirmed' WHERE id = ?");
    $stmt->execute([$id]);

    // // Se quiser, pode decodificar a resposta
    $responseData = json_decode($response, true);


    return redirect('/reservations');
  }
  public function index()
  {
    $db = Database::connection();
    $id = Auth::user()['id'];

    $stmt = $db->prepare(
      "SELECT
            r.*,
            u.name as customer
        FROM
            Reservation r
        JOIN
          Users u ON u.id = r.userId
        WHERE
            r.storeId = ?");
    $stmt->execute([$id]);
    $reservations = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // $singleReservation = $reservations[0];

    // $tempArr = [];

    // for ($i = 0; $i < 15; $i++) {
    //   $reservation[$i] = $singleReservation;
    //   $reservation[$i]['id'] = $i + 1;
    //   $tempArr[$i] = $reservation[$i];
    
    // }

    return $this->view('reservations', [
      'reservations' =>  $reservations,
    ]);
  }
}
