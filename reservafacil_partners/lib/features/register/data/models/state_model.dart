// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StateModel {
  int id;
  String name;
  String uf;
  StateModel({
    required this.id,
    required this.name,
    required this.uf,
  });

  StateModel copyWith({
    int? id,
    String? name,
    String? uf,
  }) {
    return StateModel(
      id: id ?? this.id,
      name: name ?? this.name,
      uf: uf ?? this.uf,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'uf': uf,
    };
  }

  factory StateModel.fromMap(Map<String, dynamic> map) {
    return StateModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? "",
      uf: map['uf'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory StateModel.fromJson(String source) =>
      StateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StateModel(id: $id, name: $name, uf: $uf)';

  @override
  bool operator ==(covariant StateModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.uf == uf;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ uf.hashCode;
}
