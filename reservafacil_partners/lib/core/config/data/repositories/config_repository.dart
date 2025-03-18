import 'package:reservafacil_partners/core/network/dio_client.dart';

import '../models/config_model.dart';

class ConfigRepository {
  final _dioClient = DioClient();

  Future<ConfigModel> getConfig() async {
    final response = await _dioClient.get("v0/config");

    if (response.statusCode == 200) {
      return ConfigModel.fromMap(response.data["data"]);
    } else {
      throw Exception("Erro ao buscar configurações");
    }
  }
}
