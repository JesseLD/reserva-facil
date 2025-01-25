import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_app/common/providers/global_state_provider.dart';
import 'package:reservafacil_app/features/login/data/models/login_model.dart';
import 'package:reservafacil_app/features/login/data/models/user_model.dart';
import '../../data/repositories/login_repository.dart';

class LoginProvider with ChangeNotifier {
  final LoginRepository _repository = LoginRepository();

  // UserModel userModel = UserModel.empty();
  LoginModel loginModel = LoginModel.empty();

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

      loginModel = response;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> refresh(
  ) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await _repository.refresh(
        email: loginModel.account.email,
      );

      loginModel = response;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      rethrow;
    }
  }
}
