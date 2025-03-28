// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AccountModel {
  int id;
  String name;
  String email;
  String? phone;
  String? cpfCnpj;
  DateTime? birthDate;
  int? storeId;
 
  String? imageUrl;

  AccountModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.cpfCnpj,
    this.birthDate,
    this.storeId,
    this.imageUrl,
  });

  static AccountModel empty() {
    return AccountModel(
      id: 0,
      name: '',
      email: '',
      cpfCnpj: '',
  
    );
  }

  AccountModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? cpfCnpj,
    DateTime? birthDate,
    int? storeId,
    String? imageUrl,
  }) {
    return AccountModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      cpfCnpj: cpfCnpj ?? this.cpfCnpj,
      birthDate: birthDate ?? this.birthDate,
      storeId: storeId ?? this.storeId,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'cpfCnpj': cpfCnpj,
      'birthDate': birthDate?.millisecondsSinceEpoch,
      'storeId': storeId,
      'imageUrl': imageUrl,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] != null ? map['phone'] as String : null,
      cpfCnpj: map['cpfCnpj'] != null ? map['cpfCnpj'] as String : null,
      birthDate: map['birthDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['birthDate'] as int) : null,
      storeId: map['storeId'] != null ? map['storeId'] as int : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AccountModel(id: $id, name: $name, email: $email, phone: $phone, cpfCnpj: $cpfCnpj, birthDate: $birthDate, storeId: $storeId, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant AccountModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.phone == phone &&
      other.cpfCnpj == cpfCnpj &&
      other.birthDate == birthDate &&
      other.storeId == storeId &&
      other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      cpfCnpj.hashCode ^
      birthDate.hashCode ^
      storeId.hashCode ^
      imageUrl.hashCode;
  }
}
