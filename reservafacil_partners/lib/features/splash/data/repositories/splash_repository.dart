
import '../models/splash_model.dart';

class SplashRepository {
  final List<SplashModel> _items = [];

  List<SplashModel> getAll() {
    return _items;
  }

  SplashModel getById(String id) {
    return SplashModel();
  }

  void create(SplashModel item) {
    _items.add(item);
  }

  void update(SplashModel item) {
    // Implement update logic here
  }

  void delete(String id) {
    // Implement delete logic here
  }
}
