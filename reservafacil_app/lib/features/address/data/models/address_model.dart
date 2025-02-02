import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddressModel {
  int id;
  String address;
  String neighborhood;
  String city;
  String state;
  String reference;
  bool selected;

  AddressModel(
    this.id,
    this.address,
    this.neighborhood,
    this.city,
    this.state,
    this.reference,
    this.selected,
  );

  AddressModel copyWith({
    int? id,
    String? address,
    String? neighborhood,
    String? city,
    String? state,
    String? reference,
    bool? selected,
  }) {
    return AddressModel(
      id ?? this.id,
      address ?? this.address,
      neighborhood ?? this.neighborhood,
      city ?? this.city,
      state ?? this.state,
      reference ?? this.reference,
      selected ?? this.selected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'address': address,
      'neighborhood': neighborhood,
      'city': city,
      'state': state,
      'reference': reference,
      'selected': selected,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      map['id'] as int,
      map['address'] as String,
      map['neighborhood'] as String,
      map['city'] as String,
      map['state'] as String,
      map['reference'] as String,
      map['selected'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddressModel(id: $id, address: $address, neighborhood: $neighborhood, city: $city, state: $state, reference: $reference, selected: $selected)';
  }

  @override
  bool operator ==(covariant AddressModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.address == address &&
      other.neighborhood == neighborhood &&
      other.city == city &&
      other.state == state &&
      other.reference == reference &&
      other.selected == selected;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      address.hashCode ^
      neighborhood.hashCode ^
      city.hashCode ^
      state.hashCode ^
      reference.hashCode ^
      selected.hashCode;
  }
}
