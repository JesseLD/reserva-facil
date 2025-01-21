// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterModel {
  String name;
  String email;
  String password;
  String cpfCnpj;
  
  RegisterModel({
    required this.name,
    required this.email,
    required this.password,
    required this.cpfCnpj,
  });

  RegisterModel copyWith({
    String? name,
    String? email,
    String? password,
    String? cpfCnpj,
  }) {
    return RegisterModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      cpfCnpj: cpfCnpj ?? this.cpfCnpj,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'cpfCnpj': cpfCnpj,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      cpfCnpj: map['cpfCnpj'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) => RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterModel(name: $name, email: $email, password: $password, cpfCnpj: $cpfCnpj)';
  }

  @override
  bool operator ==(covariant RegisterModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.password == password &&
      other.cpfCnpj == cpfCnpj;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      cpfCnpj.hashCode;
  }
}
