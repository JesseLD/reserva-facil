import 'package:reservafacil_app/core/network/dio_client.dart';
import 'package:reservafacil_app/features/restaurant/data/models/restaurant_model.dart';

import '../models/reservation_model.dart';

class ReservationRepository {
  final _dioClient = DioClient();

  Future<List<ReservationModel>> getReservations(int id) async {
    final response = await _dioClient.get("reservation/$id");

    if (response.statusCode == 200) {
      final data = response.data["data"];

      print("Data: $data");
      return data
          .map<ReservationModel>((e) => ReservationModel.fromMap(e))
          .toList();
    } else {
      throw Exception("Erro ao buscar reservas");
    }
  }
}
