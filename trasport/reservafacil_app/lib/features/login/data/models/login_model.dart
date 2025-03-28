// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:reservafacil_app/features/account/data/models/account_model.dart';

class LoginModel {
  AccountModel account;
  LoginModel({
    required this.account,
  });

  LoginModel.empty() : account = AccountModel.empty();

  LoginModel copyWith({
    AccountModel? account,
  }) {
    return LoginModel(
      account: account ?? this.account,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'account': account.toMap(),
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      account: AccountModel.fromMap(map['account'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginModel(account: $account)';

  @override
  bool operator ==(covariant LoginModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.account == account;
  }

  @override
  int get hashCode => account.hashCode;
}
