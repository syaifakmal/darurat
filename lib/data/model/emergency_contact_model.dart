import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

EmergencyContact emergencyContactFromJson(String str) => EmergencyContact.fromJson(json.decode(str));

String emergencyContactToJson(EmergencyContact data) => json.encode(data.toJson());

class EmergencyContact {
  EmergencyContact({
    required this.id,
    required this.name,
    required this.number,
    required this.type,
    required this.createdTime,
    required this.updatedTime,
  });

  int id;
  String name;
  String number;
  String type;
  DateTime createdTime;
  DateTime updatedTime;

  EmergencyContact copyWith({
    int? id,
    String? name,
    String? number,
    String? type,
    DateTime? createdTime,
    DateTime? updatedTime,
  }) =>
      EmergencyContact(
        id: id ?? this.id,
        name: name ?? this.name,
        number: number ?? this.number,
        type: type ?? this.type,
        createdTime: createdTime ?? this.createdTime,
        updatedTime: updatedTime ?? this.updatedTime,
      );

  factory EmergencyContact.fromJson(Map<String, dynamic> json) => EmergencyContact(
        id: json["id"],
        name: json["name"],
        number: json["number"],
        type: json["type"],
        createdTime: _parseTimestamp(json["createdTime"]),
        updatedTime: _parseTimestamp(json["updatedTime"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "number": number,
        "type": type,
        "createdTime": createdTime.toIso8601String(),
        "updatedTime": updatedTime.toIso8601String(),
      };

  static DateTime _parseTimestamp(dynamic timestamp) {
    return (timestamp as Timestamp).toDate();
  }
}

class EmergencyContactField {
  static const String id = '_id';
  static const String name = 'name';
  static const String number = 'number';
  static const String type = 'type';
  static const String createdTime = 'createdTime';
  static const String updatedTime = 'updatedTime';
}
