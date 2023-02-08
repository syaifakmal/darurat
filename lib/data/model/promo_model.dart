import 'dart:convert';

PromoModel promoModelFromJson(String str) => PromoModel.fromJson(json.decode(str));

String promoModelToJson(PromoModel data) => json.encode(data.toJson());

class PromoModel {
  PromoModel({
    this.id,
    this.title,
    this.header,
    this.description,
    this.type,
    this.status,
    this.uploadFile,
  });

  String? id;
  String? title;
  String? header;
  String? description;
  String? type;
  String? status;
  String? uploadFile;

  PromoModel copyWith({
    String? id,
    String? title,
    String? header,
    String? description,
    String? type,
    String? status,
    String? uploadFile,
  }) =>
      PromoModel(
        id: id ?? this.id,
        title: title ?? this.title,
        header: header ?? this.header,
        description: description ?? this.description,
        type: type ?? this.type,
        status: status ?? this.status,
        uploadFile: uploadFile ?? this.uploadFile,
      );

  factory PromoModel.fromJson(Map<String, dynamic> json) => PromoModel(
        id: json["ID"],
        title: json["TITLE"],
        header: json["HEADER"],
        description: json["DESCRIPTION"],
        type: json["TYPE"],
        status: json["STATUS"],
        uploadFile: json["UPLOAD_FILE"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "TITLE": title,
        "HEADER": header,
        "DESCRIPTION": description,
        "TYPE": type,
        "STATUS": status,
        "UPLOAD_FILE": uploadFile,
      };
}
