// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ConfigModel {
  String version;
  int buildNumber;
  String track;
  DateTime createdAt;

  ConfigModel(
    this.version,
    this.buildNumber,
    this.track,
    this.createdAt,
  );

  ConfigModel.empty()
      : version = '',
        buildNumber = 0,
        track = '',
        createdAt = DateTime.now();

  ConfigModel copyWith({
    String? version,
    int? buildNumber,
    String? track,
    DateTime? createdAt,
  }) {
    return ConfigModel(
      version ?? this.version,
      buildNumber ?? this.buildNumber,
      track ?? this.track,
      createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'version': version,
      'buildNumber': buildNumber,
      'track': track,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory ConfigModel.fromMap(Map<String, dynamic> map) {
    return ConfigModel(
      map['version'] ?? "",
      map['buildNumber'] ?? 0,
      map['track'] ?? "",
      DateTime.parse(map['createdAt'] ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigModel.fromJson(String source) => ConfigModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ConfigModel(version: $version, buildNumber: $buildNumber, track: $track, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant ConfigModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.version == version &&
      other.buildNumber == buildNumber &&
      other.track == track &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return version.hashCode ^
      buildNumber.hashCode ^
      track.hashCode ^
      createdAt.hashCode;
  }
}
