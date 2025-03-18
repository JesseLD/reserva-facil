// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:reservafacil_partners/features/restaurant/data/models/restaurant_model.dart';

class ReservationModel {
  String date; // Formatted Date
  RestaurantModel restaurant;
  String status;
  int reservationNumber;
  int numberOfPeople;
  double rating;

  ReservationModel({
    required this.date,
    required this.restaurant,
    required this.status,
    required this.reservationNumber,
    required this.numberOfPeople,
    required this.rating,
  });

  ReservationModel copyWith({
    String? date,
    RestaurantModel? restaurant,
    String? status,
    int? reservationNumber,
    int? numberOfPeople,
    double? rating,
  }) {
    return ReservationModel(
      date: date ?? this.date,
      restaurant: restaurant ?? this.restaurant,
      status: status ?? this.status,
      reservationNumber: reservationNumber ?? this.reservationNumber,
      numberOfPeople: numberOfPeople ?? this.numberOfPeople,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'restaurant': restaurant.toMap(),
      'status': status,
      'reservationNumber': reservationNumber,
      'numberOfPeople': numberOfPeople,
      'rating': rating,
    };
  }

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      date: map['date'] as String,
      restaurant:
          RestaurantModel.fromMap(map['restaurant'] as Map<String, dynamic>),
      status: map['status'] as String,
      reservationNumber: map['reservationNumber'] as int,
      numberOfPeople: map['numberOfPeople'] as int,
      rating: map['rating'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservationModel.fromJson(String source) =>
      ReservationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReservationModel(date: $date, restaurant: $restaurant, status: $status, reservationNumber: $reservationNumber, numberOfPeople: $numberOfPeople, rating: $rating)';
  }

  @override
  bool operator ==(covariant ReservationModel other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.restaurant == restaurant &&
        other.status == status &&
        other.reservationNumber == reservationNumber &&
        other.numberOfPeople == numberOfPeople &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        restaurant.hashCode ^
        status.hashCode ^
        reservationNumber.hashCode ^
        numberOfPeople.hashCode ^
        rating.hashCode;
  }
}
