
import '../models/config_model.dart';

class ConfigRepository {
  final List<ConfigModel> _items = [];

  List<ConfigModel> getAll() {
    return _items;
  }

  ConfigModel getById(String id) {
    return ConfigModel();
  }

  void create(ConfigModel item) {
    _items.add(item);
  }

  void update(ConfigModel item) {
    // Implement update logic here
  }

  void delete(String id) {
    // Implement delete logic here
  }
}
