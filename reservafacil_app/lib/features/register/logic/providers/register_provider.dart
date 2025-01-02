
import 'package:flutter/material.dart';
import '../../data/repositories/register_repository.dart';
import '../../data/models/register_model.dart';

class RegisterProvider with ChangeNotifier {
  final RegisterRepository _repository = RegisterRepository();

  List<RegisterModel> get items => _repository.getAll();

  void add(RegisterModel item) {
    _repository.create(item);
    notifyListeners();
  }

  RegisterModel getById(String id) {
    return _repository.getById(id);
  }

  void update(RegisterModel item) {
    _repository.update(item);
    notifyListeners();
  }

  void delete(String id) {
    _repository.delete(id);
    notifyListeners();
  }
}
