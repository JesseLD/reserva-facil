
import 'package:reservafacil_app/core/network/dio_client.dart';

import '../models/register_model.dart';

class RegisterRepository {
  final  _dioClient = DioClient();


  Future<void> register(RegisterModel registerModel) async {
     final response = await _dioClient.post(
        'v0/users/create',
        data: registerModel.toMap(),
      );


    if( response.statusCode == 400) {
      final exception = response.data['exception'];

      throw Exception(exception);
    }
   
  }
}
