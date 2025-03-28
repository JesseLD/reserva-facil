// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ReservationPayloadModel {

  int storeId;
  int userId;
  int partySize;
  DateTime date;
  String observation;

  ReservationPayloadModel({
    required this.storeId,
    required this.userId,
    required this.partySize,
    required this.date,
    required this.observation,
  });

  ReservationPayloadModel copyWith({
    int? storeId,
    int? userId,
    int? partySize,
    DateTime? date,
    String? observation,
  }) {
    return ReservationPayloadModel(
      storeId: storeId ?? this.storeId,
      userId: userId ?? this.userId,
      partySize: partySize ?? this.partySize,
      date: date ?? this.date,
      observation: observation ?? this.observation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'storeId': storeId,
      'userId': userId,
      'partySize': partySize,
      'date': date.toIso8601String(),
      'observation': observation,
    };
  }

  factory ReservationPayloadModel.fromMap(Map<String, dynamic> map) {
    return ReservationPayloadModel(
      storeId: map['storeId'] as int,
      userId: map['userId'] as int,
      partySize: map['partySize'] as int,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      observation: map['observation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservationPayloadModel.fromJson(String source) => ReservationPayloadModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReservationPayloadModel(storeId: $storeId, userId: $userId, partySize: $partySize, date: $date, observation: $observation)';
  }

  @override
  bool operator ==(covariant ReservationPayloadModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.storeId == storeId &&
      other.userId == userId &&
      other.partySize == partySize &&
      other.date == date &&
      other.observation == observation;
  }

  @override
  int get hashCode {
    return storeId.hashCode ^
      userId.hashCode ^
      partySize.hashCode ^
      date.hashCode ^
      observation.hashCode;
  }
}
