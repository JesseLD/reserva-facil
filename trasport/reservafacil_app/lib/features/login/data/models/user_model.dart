// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  int id;
  String name;
  String email;
  String? phone;
  DateTime? birthDate;
  String cpfCnpj;
  int? storeId;
  bool active;
  bool verified;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.birthDate,
    required this.cpfCnpj,
    this.storeId,
    required this.active,
    required this.verified,
  });


  static UserModel empty() {
    return UserModel(
      id: 0,
      name: "",
      email: "",
      phone: "",
      birthDate: DateTime.now(),
      cpfCnpj: "",
      storeId: 0,
      active: false,
      verified: false,
    );
  }


  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    DateTime? birthDate,
    String? cpfCnpj,
    int? storeId,
    bool? active,
    bool? verified,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      birthDate: birthDate ?? this.birthDate,
      cpfCnpj: cpfCnpj ?? this.cpfCnpj,
      storeId: storeId ?? this.storeId,
      active: active ?? this.active,
      verified: verified ?? this.verified,
    );
  }



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'birthDate': birthDate?.millisecondsSinceEpoch,
      'cpfCnpj': cpfCnpj,
      'storeId': storeId,
      'active': active,
      'verified': verified,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] != null ? map['phone'] as String : null,
      birthDate: map['birthDate'] != null ? DateTime.parse(map["birthDate"]) : null,
      cpfCnpj: map['cpfCnpj'] as String,
      storeId: map['storeId'] != null ? map['storeId'] as int : null,
      active: map['active'] == 1,
      verified: map['verified'] == 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, phone: $phone, birthDate: $birthDate, cpfCnpj: $cpfCnpj, storeId: $storeId, active: $active, verified: $verified)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.phone == phone &&
      other.birthDate == birthDate &&
      other.cpfCnpj == cpfCnpj &&
      other.storeId == storeId &&
      other.active == active &&
      other.verified == verified;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      birthDate.hashCode ^
      cpfCnpj.hashCode ^
      storeId.hashCode ^
      active.hashCode ^
      verified.hashCode;
  }
}
