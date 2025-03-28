// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:reservafacil_app/features/restaurant/data/models/opening_hours_model.dart';
import 'package:reservafacil_app/features/restaurant/data/models/product_model.dart';

class SingleRestaurantModel {
  int id;
  String name;
  int maxPartySize;
  List<ProductModel> products;
  List<OpeningHoursModel> openingHours;
  SingleRestaurantModel({
    required this.id,
    required this.name,
    required this.products,
    required this.openingHours,
    required this.maxPartySize,
  });

  SingleRestaurantModel copyWith({
    int? id,
    String? name,
    List<ProductModel>? products,
    List<OpeningHoursModel>? openingHours,
    int? maxPartySize,
  }) {
    return SingleRestaurantModel(
      id: id ?? this.id,
      name: name ?? this.name,
      products: products ?? this.products,
      openingHours: openingHours ?? this.openingHours,
      maxPartySize: maxPartySize ?? this.maxPartySize,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'products': products.map((x) => x.toMap()).toList(),
      'openingHours': openingHours.map((x) => x.toMap()).toList(),
      'maxPartySize': maxPartySize,
    };
  }

  factory SingleRestaurantModel.fromMap(Map<String, dynamic> map) {
    return SingleRestaurantModel(
      id: map['id'] as int,
      name: map['name'] as String,
      maxPartySize: map['maxPartySize'] as int,
      products: (map['products'] as List)
          .map((x) => ProductModel.fromMap(x as Map<String, dynamic>))
          .toList(),
      openingHours: (map['openingHours'] as List)
          .map((x) => OpeningHoursModel.fromMap(x as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory SingleRestaurantModel.fromJson(String source) =>
      SingleRestaurantModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SingleRestaurantModel(id: $id, name: $name, products: $products, openingHours: $openingHours)';
  }

  @override
  bool operator ==(covariant SingleRestaurantModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        listEquals(other.products, products) &&
        listEquals(other.openingHours, openingHours);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        products.hashCode ^
        openingHours.hashCode;
  }
}
