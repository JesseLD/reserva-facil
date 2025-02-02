import 'package:flutter/material.dart';
import 'package:reservafacil_app/core/network/dio_client.dart';
import 'package:reservafacil_app/features/restaurant/data/models/restaurant_model.dart';
import '../../data/repositories/reservation_repository.dart';
import '../../data/models/reservation_model.dart';

class ReservationProvider with ChangeNotifier {
  final ReservationRepository _repository = ReservationRepository();

  List<ReservationModel> reservations = [
    ReservationModel(
      date: "Sex, 31 Janeiro 2025",
      restaurant: RestaurantModel(
        1,
        "McDonald's",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/McDonald%27s_square_2020.svg/640px-McDonald%27s_square_2020.svg.png",
        4.7,
        "Lanches",
        true,
        30.99,
        50.99,
        4,
      ),
      status: "FINISHED",
      reservationNumber: 2146,
      numberOfPeople: 4,
      rating: 4.5,
    ),
    ReservationModel(
      date: "Qui, 16 Janeiro 2025",
      restaurant: RestaurantModel(
        3,
        "Mega Açaíteria",
        "https://static.goomer.app/stores/149448/products/mobile_menu/templates/228185/logo_512x512_v1630365126.jpeg",
        4.0,
        "Açaí",
        false,
        15.00,
        25.00,
        4,
      ),
      status: "FINISHED",
      reservationNumber: 346,
      numberOfPeople: 2,
      rating: 4.7,
    ),
    ReservationModel(
      date: "Ter, 19 Novembro 2024",
      restaurant: RestaurantModel(
          8,
          "Luti's",
          "${DioClient.apiUrl}uuploads/2025/01/logo-lutis.png",
          5.0,
          "Lanches",
          true,
          79.99,
          89.99,
          8),
      status: "FINISHED",
      reservationNumber: 1356,
      numberOfPeople: 4,
      rating: 5,
    )
  ];
}
