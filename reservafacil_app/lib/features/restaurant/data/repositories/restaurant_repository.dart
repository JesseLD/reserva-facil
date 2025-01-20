
import '../models/restaurant_model.dart';

class RestaurantRepository {
  final List<RestaurantModel> _items = [];

  List<RestaurantModel> getAll() {
    return _items;
  }

  RestaurantModel getById(String id) {
    return RestaurantModel();
  }

  void create(RestaurantModel item) {
    _items.add(item);
  }

  void update(RestaurantModel item) {
    // Implement update logic here
  }

  void delete(String id) {
    // Implement delete logic here
  }
}
