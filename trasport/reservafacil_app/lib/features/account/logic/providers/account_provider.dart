import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reservafacil_app/core/network/dio_client.dart';
import '../../data/repositories/account_repository.dart';
import '../../data/models/account_model.dart';

class AccountProvider with ChangeNotifier {
  final AccountRepository _repository = AccountRepository();

  AccountModel accountModel = AccountModel.empty();
  bool isLoading = false;

  Future<void> getAccount(int userId) async {
    isLoading = true;
    notifyListeners();

    accountModel = await _repository.getAccount(userId);

    // accountModel.imageUrl = "https://reservafacil.s3.amazonaws.com/uploads/2021/09/14/1631630000-1631630000.jpg";
    accountModel.imageUrl =
        DioClient.getImageBaseURL() + accountModel.imageUrl!;

    isLoading = false;
    notifyListeners();
  }

  Future<void> updateProfileImage(int userId, XFile? image) async {
    await _repository.updateProfileImage(userId, image);
    // await getAccount(userId);
  }

  Future<void> updateProfileImageWeb(int userId, XFile? image) async {
    await _repository.updateProfileImageWeb(userId, image);
    // await getAccount(userId);
  }

  Future<void> removeProfileImage(int userId, String filename) async {
    await _repository.removeProfileImage(userId, filename);
    // await getAccount(userId);
  }

  Future<void> updateAccount(AccountModel accountModel) async {
    await _repository.updateAccount(accountModel);
    // await getAccount(accountModel.id);
  }

  Future<void> updatePassword(int userId, String password) async {
    await _repository.updatePassword(userId, password);
  }

  // Future<String> getUserI
}
