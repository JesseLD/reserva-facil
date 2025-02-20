
import 'package:flutter/material.dart';
import '../../data/repositories/settings_repository.dart';
import '../../data/models/settings_model.dart';

class SettingsProvider with ChangeNotifier {
  final SettingsRepository _repository = SettingsRepository();

  List<SettingsModel> get items => _repository.getAll();

  void add(SettingsModel item) {
    _repository.create(item);
    notifyListeners();
  }

  SettingsModel getById(String id) {
    return _repository.getById(id);
  }

  void update(SettingsModel item) {
    _repository.update(item);
    notifyListeners();
  }

  void delete(String id) {
    _repository.delete(id);
    notifyListeners();
  }
}
