import 'package:flutter/material.dart';
import '../../data/repositories/register_repository.dart';
import '../../data/models/register_model.dart';

class RegisterProvider with ChangeNotifier {
  final RegisterRepository _repository = RegisterRepository();

  bool isLoading = false;

  bool cameFromLogin = false;

  Future<void> register(RegisterModel registerModel) async {
    isLoading = true;
    notifyListeners();

    try {
      await _repository.register(registerModel);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      rethrow;
    }
  }
}
