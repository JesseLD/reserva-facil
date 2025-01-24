// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AccountModel {
  int id;
  String name;
  String email;
  String? phone;
  String cpf;
  DateTime? birthDate;
  int? storeId;
  bool active;
  bool verified;
  DateTime verifiedAt;
  String? imageUrl;

  AccountModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.cpf,
    this.birthDate,
    this.storeId,
    required this.active,
    required this.verified,
    required this.verifiedAt,
    this.imageUrl,
  });

  static AccountModel empty() {
    return AccountModel(
      id: 0,
      name: '',
      email: '',
      cpf: '',
      active: false,
      verified: false,
      verifiedAt: DateTime(1970),
    );
  }

  AccountModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? cpf,
    DateTime? birthDate,
    int? storeId,
    bool? active,
    bool? verified,
    DateTime? verifiedAt,
    String? imageUrl,
  }) {
    return AccountModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      cpf: cpf ?? this.cpf,
      birthDate: birthDate ?? this.birthDate,
      storeId: storeId ?? this.storeId,
      active: active ?? this.active,
      verified: verified ?? this.verified,
      verifiedAt: verifiedAt ?? this.verifiedAt,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'cpf': cpf,
      'birthDate': birthDate?.toIso8601String(),
      'storeId': storeId,
      'active': active,
      'verified': verified,
      'verifiedAt': verifiedAt.toIso8601String(),
      'imageUrl': imageUrl,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? "",
      email: map['email'] ?? "",
      phone: map['phone'] != null ? map['phone'] ?? "" : null,
      cpf: map['cpf'] ?? "",
      birthDate:
          map['birthDate'] != null ? DateTime.parse(map['birthDate']) : null,
      storeId: map['storeId'] != null ? map['storeId'] ?? 0 : null,
      active: map['active'] == 1,
      verified: map['verified'] == 1,
      verifiedAt: DateTime.parse(map['verifiedAt']),
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] ?? "" : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AccountModel(id: $id, name: $name, email: $email, phone: $phone, cpf: $cpf, birthDate: $birthDate, storeId: $storeId, active: $active, verified: $verified, verifiedAt: $verifiedAt, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant AccountModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.cpf == cpf &&
        other.birthDate == birthDate &&
        other.storeId == storeId &&
        other.active == active &&
        other.verified == verified &&
        other.verifiedAt == verifiedAt &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        cpf.hashCode ^
        birthDate.hashCode ^
        storeId.hashCode ^
        active.hashCode ^
        verified.hashCode ^
        verifiedAt.hashCode ^
        imageUrl.hashCode;
  }
}
