import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OpeningHoursModel {

  int id;
  int weekDay;
  String openingTime;
  String closeTime;
  bool inactive;

  OpeningHoursModel({
    required this.id,
    required this.weekDay,
    required this.openingTime,
    required this.closeTime,
    required this.inactive,
  });
  

  OpeningHoursModel copyWith({
    int? id,
    int? weekDay,
    String? openingTime,
    String? closeTime,
    bool? inactive,
  }) {
    return OpeningHoursModel(
      id: id ?? this.id,
      weekDay: weekDay ?? this.weekDay,
      openingTime: openingTime ?? this.openingTime,
      closeTime: closeTime ?? this.closeTime,
      inactive: inactive ?? this.inactive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'weekDay': weekDay,
      'openingTime': openingTime,
      'closeTime': closeTime,
      'inactive': inactive,
    };
  }

  factory OpeningHoursModel.fromMap(Map<String, dynamic> map) {
    return OpeningHoursModel(
      id: map['id'] as int,
      weekDay: map['weekDay'] as int,
      openingTime: map['openingTime'] as String,
      closeTime: map['closeTime'] as String,
      inactive: map['inactive'] == 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory OpeningHoursModel.fromJson(String source) => OpeningHoursModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OpeningHoursModel(id: $id, weekDay: $weekDay, openingTime: $openingTime, closeTime: $closeTime, inactive: $inactive)';
  }

  @override
  bool operator ==(covariant OpeningHoursModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.weekDay == weekDay &&
      other.openingTime == openingTime &&
      other.closeTime == closeTime &&
      other.inactive == inactive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      weekDay.hashCode ^
      openingTime.hashCode ^
      closeTime.hashCode ^
      inactive.hashCode;
  }
}
