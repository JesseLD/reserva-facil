
import '../models/login_model.dart';

class LoginRepository {
  final List<LoginModel> _items = [];

  List<LoginModel> getAll() {
    return _items;
  }

  LoginModel getById(String id) {
    return LoginModel();
  }

  void create(LoginModel item) {
    _items.add(item);
  }

  void update(LoginModel item) {
    // Implement update logic here
  }

  void delete(String id) {
    // Implement delete logic here
  }
}
