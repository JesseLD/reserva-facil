import 'package:flutter/material.dart';
import 'package:reservafacil_partners/features/login/data/repositories/recover_password_repository.dart';

class RecoverPasswordProvider with ChangeNotifier {
  final _recoverPasswordRepository = RecoverPasswordRepository();
  String email = "";
  int index = 0;
  int steps = 3;

  int code = 0;

  void nextStep() {
    // index++;
    if (index == steps) {
      index = 3;
    } else {
      index++;
    }

    notifyListeners();
  }

  void previousStep() {
    if (index == 0) {
      index = 0;
    } else {
      index--;
    }

    notifyListeners();
  }

  void reset() {
    index = 0;
    notifyListeners();
  }

  Future<void> recoverPassword({
    required String email,
  }) async {
    final response = await _recoverPasswordRepository.recoverPassword(
      email: email,
    );

    code = response;
    // code = 123456;
    notifyListeners();
  }

  Future<void> updatePassword({
    required String email,
    required String password,
  }) async {
    await _recoverPasswordRepository.updatePassword(
      email: email,
      password: password,
    );

    notifyListeners();
  }
}
