
import '../models/search_model.dart';

class SearchRepository {
  final List<SearchModel> _items = [];

  List<SearchModel> getAll() {
    return _items;
  }

  SearchModel getById(String id) {
    return SearchModel();
  }

  void create(SearchModel item) {
    _items.add(item);
  }

  void update(SearchModel item) {
    // Implement update logic here
  }

  void delete(String id) {
    // Implement delete logic here
  }
}
