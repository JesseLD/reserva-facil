import 'package:flutter/material.dart';
import '../../data/repositories/address_repository.dart';
import '../../data/models/address_model.dart';

class AddressProvider with ChangeNotifier {
  final AddressRepository _repository = AddressRepository();

  int selectedAddress = 0;

  List<AddressModel> addresses = [
    AddressModel(
      1,
      'Av. Antônio Carlos Magalhães, 545',
      'São Félix',
      'Valença',
      'BA',
      'Próximo ao posto de gasolina',
      false,
    ),
    AddressModel(
      2,
      'R. dos Bobos, 0',
      'Duque de Caxias',
      'Cidade de Deus',
      'RJ',
      'Próximo ao mercado',
      false,
    ),
  ];
}
