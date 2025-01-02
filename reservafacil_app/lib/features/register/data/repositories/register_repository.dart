
import '../models/register_model.dart';

class RegisterRepository {
  final List<RegisterModel> _items = [];

  List<RegisterModel> getAll() {
    return _items;
  }

  RegisterModel getById(String id) {
    return RegisterModel();
  }

  void create(RegisterModel item) {
    _items.add(item);
  }

  void update(RegisterModel item) {
    // Implement update logic here
  }

  void delete(String id) {
    // Implement delete logic here
  }
}
