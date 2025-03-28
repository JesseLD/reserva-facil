
import '../models/onboarding_model.dart';

class OnboardingRepository {
  final List<OnboardingModel> _items = [];

  List<OnboardingModel> getAll() {
    return _items;
  }

  OnboardingModel getById(String id) {
    return OnboardingModel();
  }

  void create(OnboardingModel item) {
    _items.add(item);
  }

  void update(OnboardingModel item) {
    // Implement update logic here
  }

  void delete(String id) {
    // Implement delete logic here
  }
}
