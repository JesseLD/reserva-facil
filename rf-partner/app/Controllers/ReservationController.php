<?php

namespace App\Controllers;

use Core\Auth;
use Core\Controller;
use Core\Database;
use PDO;

class ReservationController extends Controller
{
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

    $singleReservation = $reservations[0];

    $tempArr = [];

    for ($i = 0; $i < 15; $i++) {
      $reservation[$i] = $singleReservation;
      $reservation[$i]['id'] = $i + 1;
      $tempArr[$i] = $reservation[$i];
    
    }

    return $this->view('reservations', [
      'reservations' => $tempArr,
    ]);
  }
}
