
import 'package:flutter/material.dart';
import '../../data/repositories/config_repository.dart';
import '../../data/models/config_model.dart';

class ConfigProvider with ChangeNotifier {
  final ConfigRepository _repository = ConfigRepository();

  ConfigModel configModel = ConfigModel.empty();

  Future<void> getConfig() async {
    try {
      final response = await _repository.getConfig();
      configModel = response;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
