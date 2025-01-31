
import 'package:flutter/material.dart';
import '../../data/repositories/search_repository.dart';
import '../../data/models/search_model.dart';

class SearchProvider with ChangeNotifier {
  final SearchRepository _repository = SearchRepository();

  List<SearchModel> get items => _repository.getAll();

  void add(SearchModel item) {
    _repository.create(item);
    notifyListeners();
  }

  SearchModel getById(String id) {
    return _repository.getById(id);
  }

  void update(SearchModel item) {
    _repository.update(item);
    notifyListeners();
  }

  void delete(String id) {
    _repository.delete(id);
    notifyListeners();
  }
}
