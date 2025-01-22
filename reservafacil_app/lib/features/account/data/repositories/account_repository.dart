import 'package:reservafacil_app/core/network/dio_client.dart';

import '../models/account_model.dart';

class AccountRepository {
  final _dioClient = DioClient();

  Future<AccountModel> getAccount(int userId) async {
    final response = await _dioClient.get('v0/users/account/$userId');

    if (response.statusCode == 400) {
      final exception = response.data['exception'];

      throw Exception(exception);
    }

    return AccountModel.fromMap(response.data);
  }
}
