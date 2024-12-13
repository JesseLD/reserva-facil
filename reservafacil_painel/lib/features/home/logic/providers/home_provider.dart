
import 'package:flutter/material.dart';
import '../../data/repositories/home_repository.dart';
import '../../data/models/home_model.dart';

class HomeProvider with ChangeNotifier {
  final HomeRepository _repository = HomeRepository();

  List<HomeModel> get items => _repository.getAll();

  void add(HomeModel item) {
    _repository.create(item);
    notifyListeners();
  }

  HomeModel getById(String id) {
    return _repository.getById(id);
  }

  void update(HomeModel item) {
    _repository.update(item);
    notifyListeners();
  }

  void delete(String id) {
    _repository.delete(id);
    notifyListeners();
  }
}
