// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RestaurantModel {
  int id;
  String name;
  String logoUrl;
  double rating;
  String category;
  bool isFavorite;
  double priceRangeStart;
  double priceRangeEnd;
  int capacity;

  RestaurantModel(
    this.id,
    this.name,
    this.logoUrl,
    this.rating,
    this.category,
    this.isFavorite,
    this.priceRangeStart,
    this.priceRangeEnd,
    this.capacity,
  );

  RestaurantModel copyWith({
    int? id,
    String? name,
    String? logoUrl,
    double? rating,
    String? category,
    bool? isFavorite,
    double? priceRangeStart,
    double? priceRangeEnd,
    int? capacity,
  }) {
    return RestaurantModel(
      id ?? this.id,
      name ?? this.name,
      logoUrl ?? this.logoUrl,
      rating ?? this.rating,
      category ?? this.category,
      isFavorite ?? this.isFavorite,
      priceRangeStart ?? this.priceRangeStart,
      priceRangeEnd ?? this.priceRangeEnd,
      capacity ?? this.capacity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'logoUrl': logoUrl,
      'rating': rating,
      'category': category,
      'isFavorite': isFavorite,
      'priceRangeStart': priceRangeStart,
      'priceRangeEnd': priceRangeEnd,
      'capacity': capacity,
    };
  }

  factory RestaurantModel.fromMap(Map<String, dynamic> map) {
    return RestaurantModel(
      map['id'] as int,
      map['name'] as String,
      map['logoUrl'] as String,
      map['rating'] as double,
      map['category'] as String,
      map['isFavorite'] as bool,
      map['priceRangeStart'] as double,
      map['priceRangeEnd'] as double,
      map['capacity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory RestaurantModel.fromJson(String source) => RestaurantModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RestaurantModel(id: $id, name: $name, logoUrl: $logoUrl, rating: $rating, category: $category, isFavorite: $isFavorite, priceRangeStart: $priceRangeStart, priceRangeEnd: $priceRangeEnd, capacity: $capacity)';
  }

  @override
  bool operator ==(covariant RestaurantModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.logoUrl == logoUrl &&
      other.rating == rating &&
      other.category == category &&
      other.isFavorite == isFavorite &&
      other.priceRangeStart == priceRangeStart &&
      other.priceRangeEnd == priceRangeEnd &&
      other.capacity == capacity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      logoUrl.hashCode ^
      rating.hashCode ^
      category.hashCode ^
      isFavorite.hashCode ^
      priceRangeStart.hashCode ^
      priceRangeEnd.hashCode ^
      capacity.hashCode;
  }
}
