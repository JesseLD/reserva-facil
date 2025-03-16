// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StateCityModel {
  String uf;
  String state;
  String city;
  StateCityModel({
    required this.uf,
    required this.state,
    required this.city,
  });

  StateCityModel.empty()
    : uf = '',
      state = '',
      city = '';

  StateCityModel copyWith({
    String? uf,
    String? state,
    String? city,
  }) {
    return StateCityModel(
      uf: uf ?? this.uf,
      state: state ?? this.state,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uf': uf,
      'state': state,
      'city': city,
    };
  }

  factory StateCityModel.fromMap(Map<String, dynamic> map) {
    return StateCityModel(
      uf: map['uf'] ?? '',
      state: map['estado'] ?? '',
      city: map['localidade'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StateCityModel.fromJson(String source) => StateCityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StateCityModel(uf: $uf, state: $state, city: $city)';

  @override
  bool operator ==(covariant StateCityModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.uf == uf &&
      other.state == state &&
      other.city == city;
  }

  @override
  int get hashCode => uf.hashCode ^ state.hashCode ^ city.hashCode;
}
