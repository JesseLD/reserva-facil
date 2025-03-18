// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:reservafacil_partners/features/register/data/models/state_model.dart';
import 'package:reservafacil_partners/features/register/data/models/store_category.dart';

class RegisterModel {
  String name; 
  String phone;
  String email;
  String cpfCnpj;
  String password;
  String cep;
  StateModel state;
  String city;
  String address;
  String storeName;
  StoreCategory category;
  int reservationCapacity;
  int maxPartySize;
  
  RegisterModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.cpfCnpj,
    required this.password,
    required this.cep,
    required this.state,
    required this.city,
    required this.address,
    required this.storeName,
    required this.category,
    required this.reservationCapacity,
    required this.maxPartySize,
  });

  

  RegisterModel copyWith({
    String? name,
    String? phone,
    String? email,
    String? cpfCnpj,
    String? password,
    String? cep,
    StateModel? state,
    String? city,
    String? address,
    String? storeName,
    StoreCategory? category,
    int? reservationCapacity,
    int? maxPartySize,
  }) {
    return RegisterModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      cpfCnpj: cpfCnpj ?? this.cpfCnpj,
      password: password ?? this.password,
      cep: cep ?? this.cep,
      state: state ?? this.state,
      city: city ?? this.city,
      address: address ?? this.address,
      storeName: storeName ?? this.storeName,
      category: category ?? this.category,
      reservationCapacity: reservationCapacity ?? this.reservationCapacity,
      maxPartySize: maxPartySize ?? this.maxPartySize,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'email': email,
      'cpfCnpj': cpfCnpj,
      'password': password,
      'cep': cep,
      'state': state.toMap(),
      'city': city,
      'address': address,
      'storeName': storeName,
      'category': category.toMap(),
      'reservationCapacity': reservationCapacity,
      'maxPartySize': maxPartySize,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      name: map['name'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      cpfCnpj: map['cpfCnpj'] as String,
      password: map['password'] as String,
      cep: map['cep'] as String,
      state: StateModel.fromMap(map['state'] as Map<String,dynamic>),
      city: map['city'] as String,
      address: map['address'] as String,
      storeName: map['storeName'] as String,
      category: StoreCategory.fromMap(map['category'] as Map<String,dynamic>),
      reservationCapacity: map['reservationCapacity'] as int,
      maxPartySize: map['maxPartySize'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) => RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterModel(name: $name, phone: $phone, email: $email, cpfCnpj: $cpfCnpj, password: $password, cep: $cep, state: $state, city: $city, address: $address, storeName: $storeName, category: $category, reservationCapacity: $reservationCapacity, maxPartySize: $maxPartySize)';
  }

  @override
  bool operator ==(covariant RegisterModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.phone == phone &&
      other.email == email &&
      other.cpfCnpj == cpfCnpj &&
      other.password == password &&
      other.cep == cep &&
      other.state == state &&
      other.city == city &&
      other.address == address &&
      other.storeName == storeName &&
      other.category == category &&
      other.reservationCapacity == reservationCapacity &&
      other.maxPartySize == maxPartySize;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      phone.hashCode ^
      email.hashCode ^
      cpfCnpj.hashCode ^
      password.hashCode ^
      cep.hashCode ^
      state.hashCode ^
      city.hashCode ^
      address.hashCode ^
      storeName.hashCode ^
      category.hashCode ^
      reservationCapacity.hashCode ^
      maxPartySize.hashCode;
  }
}
