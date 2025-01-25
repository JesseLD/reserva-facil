import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reservafacil_app/common/utils/logger.dart';
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

  Future<void> updateProfileImage(int userId, XFile? image) async {
    if (image == null) return;

    var formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(image.path,
          contentType: DioMediaType.parse("image/*")),
    });

    final response = await _dioClient
        .post('v0/users/upload-image/$userId', data: formData, headers: {
      'Content-Type': 'multipart/form-data',
    });

    if (response.statusCode == 400) {
      final exception = response.data['exception'];
      // Logger.log(exception);
      throw Exception(exception);
    }
    Logger.log(response.data);
  }

  Future<void> removeProfileImage(int userId, String filename) async {
    final response = await _dioClient.delete('v0/users/remove-image', data: {
      'userId': userId,
      'filename': filename,
    });

    if (response.statusCode == 400) {
      final exception = response.data['exception'];

      throw Exception(exception);
    }
  }

  Future<void> updateAccount(AccountModel accountModel) async {
    final response = await _dioClient.put(
      'v0/users/update/',
      data: accountModel.toMap(),
    );

    if (response.statusCode == 400) {
      final exception = response.data['exception'];

      throw Exception(exception);
    }
  }

  Future<void> updatePassword(int userId, String password) async {
    final response = await _dioClient.put(
      'v0/users/update-password/',
      data: {
        'userId': userId,
        'password': password,
      },
    );

    if (response.statusCode == 400) {
      final exception = response.data['exception'];

      throw Exception(exception);
    }
  }

  // Future<void> deleteAccount(int userId) async {
  //   final response = await _dioClient.delete('v0/users/delete/$userId');

  //   if (response.statusCode == 400) {
  //     final exception = response.data['exception'];

  //     throw Exception(exception);
  //   }
  // }
}
