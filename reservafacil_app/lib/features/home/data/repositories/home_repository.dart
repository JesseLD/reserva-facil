
import '../models/home_model.dart';

class HomeRepository {
  final List<HomeModel> _items = [];

  List<HomeModel> getAll() {
    return _items;
  }

  HomeModel getById(String id) {
    return HomeModel();
  }

  void create(HomeModel item) {
    _items.add(item);
  }

  void update(HomeModel item) {
    // Implement update logic here
  }

  void delete(String id) {
    // Implement delete logic here
  }
}
