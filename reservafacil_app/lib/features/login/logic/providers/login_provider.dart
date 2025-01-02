
import 'package:flutter/material.dart';
import '../../data/repositories/login_repository.dart';
import '../../data/models/login_model.dart';

class LoginProvider with ChangeNotifier {
  final LoginRepository _repository = LoginRepository();

  List<LoginModel> get items => _repository.getAll();

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
}
