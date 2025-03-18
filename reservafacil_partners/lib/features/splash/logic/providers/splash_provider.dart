
import 'package:flutter/material.dart';
import '../../data/repositories/splash_repository.dart';
import '../../data/models/splash_model.dart';

class SplashProvider with ChangeNotifier {
  final SplashRepository _repository = SplashRepository();

  List<SplashModel> get items => _repository.getAll();

  void add(SplashModel item) {
    _repository.create(item);
    notifyListeners();
  }

  SplashModel getById(String id) {
    return _repository.getById(id);
  }

  void update(SplashModel item) {
    _repository.update(item);
    notifyListeners();
  }

  void delete(String id) {
    _repository.delete(id);
    notifyListeners();
  }
}
