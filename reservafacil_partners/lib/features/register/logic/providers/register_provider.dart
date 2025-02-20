import 'package:flutter/material.dart';
import 'package:reservafacil_partners/common/utils/logger.dart';
import 'package:reservafacil_partners/features/register/data/models/state_model.dart';
import 'package:reservafacil_partners/features/register/data/models/store_category.dart';
import '../../data/repositories/register_repository.dart';
import '../../data/models/register_model.dart';

class RegisterProvider with ChangeNotifier {
  final RegisterRepository _repository = RegisterRepository();

  List<StateModel> states = [];
  List<StoreCategory> categories = [];

  bool isLoading = false;

  bool cameFromLogin = false;

  Future<void> register(
      RegisterModel registerModel, BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      await _repository.register(registerModel);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> getStates() async {
    try {
      states = await _repository.getStates();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getCategories() async {
    try {
      categories = await _repository.getCategories();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> checkEmail(String email) async {
     return await _repository.checkEmail(email);
    
  }

  Future<bool> checkCpfCnpj(String cpfCnpj) async {
   return await _repository.checkCpfCnpj(cpfCnpj);
  }

  Future<bool> checkPhone(String phone) async {
    return await _repository.checkPhone(phone);
  }
}
