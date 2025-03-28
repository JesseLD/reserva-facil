import 'package:reservafacil_app/core/network/dio_client.dart';
import 'package:reservafacil_app/features/restaurant/data/models/reservation_payload_model.dart';
import 'package:reservafacil_app/features/restaurant/data/models/single_restaurant_model.dart';

import '../models/restaurant_model.dart';

class RestaurantRepository {
  final _dioClient = DioClient();

  Future<List<RestaurantModel>> getRestaurants() async {
    final response = await _dioClient.get("stores/list");

    if (response.statusCode == 200) {
      // return (response.data as List)
      //     .map((e) => RestaurantModel.fromMap(e))
      //     .toList();
      final data = response.data["data"];

      return data
          .map<RestaurantModel>((e) => RestaurantModel.fromMap(e))
          .toList();
    } else {
      throw Exception("Erro ao buscar restaurantes");
    }
  }

  Future<SingleRestaurantModel> getRestaurant(int id) async {
    final response = await _dioClient.get("stores/$id");

    if (response.statusCode == 200) {
      // return (response.data as List)
      //     .map((e) => RestaurantModel.fromMap(e))
      //     .toList();
      final data = response.data["data"];

      print(data);

      return SingleRestaurantModel.fromMap(data);
    } else {
      throw Exception("Erro ao buscar restaurantes");
    }
  }


  Future<void> createReservation(ReservationPayloadModel payload) async {
    final response = await _dioClient.post("reservation", data: payload.toMap());

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception("Erro ao criar reserva");
    }
  }
}
