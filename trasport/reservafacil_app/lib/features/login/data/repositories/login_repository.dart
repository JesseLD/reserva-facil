import 'package:reservafacil_app/common/utils/logger.dart';
import 'package:reservafacil_app/core/network/dio_client.dart';
import 'package:reservafacil_app/features/login/data/models/login_model.dart';

class LoginRepository {
  final _dioClient = DioClient();

  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    Logger.log("Fazendo login ${_dioClient.dio.options.baseUrl}/login");
    final response = await _dioClient.post("login", data: {
      "email": email,
      "password": password,
    });

   

    // Usuário não encontrado
    // Senha errada
    // Error de servidor

    if (response.statusCode == 200) {
      return LoginModel.fromMap(response.data["data"]);
    } else if (response.statusCode == 400) {
      final exception = response.data["exception"];

      throw Exception(exception);
      // if (exception == "UserNotFoundException") {
      //   throw Exception("Usuário não encontrado");
      // } else if (exception == "InvalidPasswordException") {
      //   throw Exception("Senha inválida");
      // } else {
      //   throw Exception("Erro ao fazer login");
      // }
    } else {
      Logger.log(response.data);

      throw Exception("Erro ao fazer login");
    }
  }

  Future<LoginModel> refresh({
    required String email,
  }) async {
    // Logger.log("Fazendo login ${_dioClient.dio.options.baseUrl}");
    final response = await _dioClient.post("v0/users/refresh", data: {
      "email": email,
    });

    if (response.statusCode == 200) {
      return LoginModel.fromMap(response.data["data"]);
    } else if (response.statusCode == 400) {
      final exception = response.data["exception"];

      throw Exception(exception);
    } else {
      Logger.log(response.data);

      throw Exception("Erro ao fazer login");
    }
  }
}
