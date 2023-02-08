import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.address,
  });

  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? address;

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? address,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        address: address ?? this.address,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["ID"],
        name: json["NAME"],
        email: json["EMAIL"],
        phoneNumber: json["PHONE_NUMBER"],
        address: json["ADDRESS"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "NAME": name,
        "EMAIL": email,
        "PHONE_NUMBER": phoneNumber,
        "ADDRESS": address,
      };
}
