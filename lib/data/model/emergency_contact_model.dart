class EmergencyContact {
  EmergencyContact({
    this.id,
    required this.name,
    required this.number,
    required this.type,
    this.createdTime,
    this.updatedTime,
  });

  int? id;
  String name;
  String number;
  String type;
  DateTime? createdTime;
  DateTime? updatedTime;

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

  factory EmergencyContact.fromJson(Map<String, dynamic> json) {
    return EmergencyContact(
      id: json["id"],
      name: json["name"],
      number: json["number"],
      type: json["type"],
      createdTime: json["createdTime"] != null ? DateTime.parse(json["createdTime"]) : null,
      updatedTime: json["updatedTime"] != null ? DateTime.parse(json["updatedTime"]) : null,
    );
  }

  Map<String, dynamic> toJson({bool withUpdateTime = true}) => {
        EmergencyContactField.id: id,
        EmergencyContactField.name: name,
        EmergencyContactField.number: number,
        EmergencyContactField.type: type,
        EmergencyContactField.createdTime: createdTime?.toString(),
        EmergencyContactField.updatedTime: withUpdateTime ? updatedTime?.toString() : null,
      };
}

class EmergencyContactField {
  static const String id = 'id';
  static const String name = 'name';
  static const String number = 'number';
  static const String type = 'type';
  static const String createdTime = 'createdTime';
  static const String updatedTime = 'updatedTime';
}
