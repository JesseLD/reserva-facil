
import 'package:flutter/material.dart';
import '../../data/repositories/config_repository.dart';
import '../../data/models/config_model.dart';

class ConfigProvider with ChangeNotifier {
  final ConfigRepository _repository = ConfigRepository();

  List<ConfigModel> get items => _repository.getAll();

  void add(ConfigModel item) {
    _repository.create(item);
    notifyListeners();
  }

  ConfigModel getById(String id) {
    return _repository.getById(id);
  }

  void update(ConfigModel item) {
    _repository.update(item);
    notifyListeners();
  }

  void delete(String id) {
    _repository.delete(id);
    notifyListeners();
  }
}
