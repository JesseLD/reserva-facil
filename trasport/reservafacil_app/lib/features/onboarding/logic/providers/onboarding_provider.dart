
import 'package:flutter/material.dart';
import '../../data/repositories/onboarding_repository.dart';
import '../../data/models/onboarding_model.dart';

class OnboardingProvider with ChangeNotifier {
  final OnboardingRepository _repository = OnboardingRepository();

  List<OnboardingModel> get items => _repository.getAll();

  void add(OnboardingModel item) {
    _repository.create(item);
    notifyListeners();
  }

  OnboardingModel getById(String id) {
    return _repository.getById(id);
  }

  void update(OnboardingModel item) {
    _repository.update(item);
    notifyListeners();
  }

  void delete(String id) {
    _repository.delete(id);
    notifyListeners();
  }
}
