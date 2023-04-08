import 'package:flutter/material.dart';

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
