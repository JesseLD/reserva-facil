import 'package:dio/dio.dart';
import 'package:reservafacil_app/core/network/dio_client.dart';
import 'package:universal_io/io.dart';
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

  Future<void> updateProfileImage(userId) async {

    var formData = FormData.fromMap({
      'image': await MultipartFile.fromFile('path/to/file', contentType: DioMediaType.parse("image/*")),
    });

    final response = await _dioClient.post('v0/users/account/update-profile-image');

    

    if (response.statusCode == 400) {
      final exception = response.data['exception'];

      throw Exception(exception);
    }
  }

  Future<void> removeProfileImage(userId) async {
    final response = await _dioClient.post('v0/users/account/remove-profile-image');

    if (response.statusCode == 400) {
      final exception = response.data['exception'];

      throw Exception(exception);
    }
  }
}
