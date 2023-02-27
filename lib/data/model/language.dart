import 'dart:convert';

import 'package:flutter/material.dart';

Language emergencyTypeFromJson(String str) => Language.fromJson(json.decode(str));

String emergencyTypeToJson(Language data) => json.encode(data.toJson());

class Language {
  Language({
    required this.title,
    required this.locale,
  });

  String title;
  Locale locale;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    title: json["title"],
    locale: json["locale"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "locale": locale.toString(),
  };
}
