
import 'package:flutter/material.dart';
import '../../data/repositories/restaurant_repository.dart';
import '../../data/models/restaurant_model.dart';

class RestaurantProvider with ChangeNotifier {
  final RestaurantRepository _repository = RestaurantRepository();

  List<RestaurantModel> get items => _repository.getAll();

  void add(RestaurantModel item) {
    _repository.create(item);
    notifyListeners();
  }

  RestaurantModel getById(String id) {
    return _repository.getById(id);
  }

  void update(RestaurantModel item) {
    _repository.update(item);
    notifyListeners();
  }

  void delete(String id) {
    _repository.delete(id);
    notifyListeners();
  }
}
