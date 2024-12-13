import 'package:flutter/material.dart';
import '../../data/repositories/login_repository.dart';
import '../../data/models/login_model.dart';

class LoginProvider with ChangeNotifier {
  final LoginRepository _repository = LoginRepository();

  List<LoginModel> get items => _repository.getAll();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool isLogged = false;

  void add(LoginModel item) {
    _repository.create(item);
    notifyListeners();
  }

  LoginModel getById(String id) {
    return _repository.getById(id);
  }

  void update(LoginModel item) {
    _repository.update(item);
    notifyListeners();
  }

  void delete(String id) {
    _repository.delete(id);
    notifyListeners();
  }

  void login({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));
    isLogged = await _repository.login(email: email, password: password);

    _isLoading = false;
    notifyListeners();
    // Implement login logic here
  }
}
