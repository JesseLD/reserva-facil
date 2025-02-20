import 'package:reservafacil_partners/common/utils/logger.dart';
import 'package:reservafacil_partners/core/network/dio_client.dart';
import 'package:reservafacil_partners/features/register/data/models/state_model.dart';
import 'package:reservafacil_partners/features/register/data/models/store_category.dart';

import '../models/register_model.dart';

class RegisterRepository {
  final _dioClient = DioClient();

  Future<void> register(RegisterModel registerModel) async {
    final response = await _dioClient.post(
      'v0/users/create',
      data: registerModel.toMap(),
    );

    if (response.statusCode == 400) {
      final exception = response.data['exception'];

      throw Exception(exception);
    }
  }

  Future<List<StateModel>> getStates() async {
    List<StateModel> statesList = [];
    final response = await _dioClient.get('v0/localization/states');

    final states = response.data['data'];

    // Logger.log("States: $states");

    statesList = states.map<StateModel>((e) => StateModel.fromMap(e)).toList();

    return statesList;
  }

  Future<List<StoreCategory>> getCategories() async {
    List<StoreCategory> categoriesList = [];

    final response = await _dioClient.get('v0/store/categories');

    final categories = response.data['data'];

    // Logger.log("Categories: $categories");

    categoriesList =
        categories.map<StoreCategory>((e) => StoreCategory.fromMap(e)).toList();

    return categoriesList;
  }

  Future<bool> checkEmail(String email) async {
    final response = await _dioClient.get('v0/store/email/$email');

    if (response.statusCode == 400) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> checkCpfCnpj(String cpfCnpj) async {
    final response = await _dioClient.get('v0/store/cpfCnpj/$cpfCnpj');


    if (response.statusCode == 400) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> checkPhone(String phone) async {
    final response = await _dioClient.get('v0/store/phone/$phone');

    if(response.statusCode == 400){
      return false;
    } else {
      return true;
    }
  }
}
