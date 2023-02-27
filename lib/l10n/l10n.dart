import 'package:darurat/utils/images.dart';
import 'package:flutter/material.dart';

class L10n {
  static final all = [const Locale('en', 'US'), const Locale('id', 'ID')];

  // static final all = [const Locale('id', '')];

  static bool isContain(Locale locale){
    return all.contains(locale);
  }

  static String getFlag(String code) {
    switch (code) {
      case 'en':
        return Images.imageEnglishFlag;
      case 'id':
        return Images.imageIndonesiaFlag;
      default:
        return Images.imageEnglishFlag;
    }
  }
}
