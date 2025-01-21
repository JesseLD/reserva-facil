import 'package:flutter/material.dart';
import 'package:reservafacil_app/features/login/data/models/user_model.dart';
import '../../data/repositories/login_repository.dart';

class LoginProvider with ChangeNotifier {
  final LoginRepository _repository = LoginRepository();

  UserModel userModel = UserModel.empty();

  bool cameFromRegister = false;

  bool isLoading = false;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await _repository.login(
        email: email,
        password: password,
      );

      userModel = response;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      rethrow;
    }
  }
}
