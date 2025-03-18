import 'package:reservafacil_partners/core/network/dio_client.dart';

class RecoverPasswordRepository {
  final _dioClient = DioClient();

  Future<int> recoverPassword({
    required String email,
  }) async {
    final response = await _dioClient.post("v0/users/recover-password", data: {
      "email": email,
    });

    if (response.statusCode == 200) {
      final code = response.data["data"]["code"];
      return int.parse(code.toString());
    } else if (response.statusCode == 400) {
      final exception = response.data["exception"];

      throw Exception(exception);
    } else {
      throw Exception("Erro ao enviar email de recuperação de senha");
    }
  }

  Future<void> updatePassword({
    required String email,
    required String password,
  }) async {
    final response = await _dioClient.put("v0/users/update-password", data: {
      "email": email,
      "password": password,
    });

    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 400) {
      final exception = response.data["exception"];

      throw Exception(exception);
    } else {
      throw Exception("Erro ao atualizar senha login");
    }
  }
}
