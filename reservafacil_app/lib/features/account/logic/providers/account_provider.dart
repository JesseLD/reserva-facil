import 'package:flutter/material.dart';
import 'package:reservafacil_app/core/network/dio_client.dart';
import '../../data/repositories/account_repository.dart';
import '../../data/models/account_model.dart';

class AccountProvider with ChangeNotifier {
  final AccountRepository _repository = AccountRepository();
  final _dioClient = DioClient();

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

  // Future<String> getUserI
}
