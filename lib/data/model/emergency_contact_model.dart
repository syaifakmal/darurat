import 'dart:convert';

EmergencyContact emergencyContactFromJson(String str) => EmergencyContact.fromJson(json.decode(str));

String emergencyContactToJson(EmergencyContact data) => json.encode(data.toJson());

class EmergencyContact {
  EmergencyContact({
    required this.id,
    required this.name,
    required this.number,
    required this.type,
  });

  int id;
  String name;
  String number;
  String type;

  EmergencyContact copyWith({
    int? id,
    String? name,
    String? number,
    String? type,
  }) =>
      EmergencyContact(
        id: id ?? this.id,
        name: name ?? this.name,
        number: number ?? this.number,
        type: type ?? this.type,
      );

  factory EmergencyContact.fromJson(Map<String, dynamic> json) => EmergencyContact(
        id: json["id"] ?? json["_id"],
        name: json["name"],
        number: json["number"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        EmergencyContactField.id: id,
        EmergencyContactField.name: name,
        EmergencyContactField.number: number,
        EmergencyContactField.type: type,
      };
}

class EmergencyContactField {
  static const String id = '_id';
  static const String name = 'name';
  static const String number = 'number';
  static const String type = 'type';
}
