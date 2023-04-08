import 'package:flutter/material.dart';
import 'package:darurat/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleRepo {
  final SharedPreferences sharedPreferences;

  LocaleRepo({required this.sharedPreferences});

  Future<void> setLanguage(Locale locale) async {
    try {
      await sharedPreferences.setString(Constant.languageCode, locale.languageCode);
      await sharedPreferences.setString(Constant.countryCode, locale.countryCode!);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> clearLanguage() async {
    try {
      await sharedPreferences.remove(Constant.languageCode);
      await sharedPreferences.remove(Constant.countryCode);
    } catch (e) {
      rethrow;
    }
  }

  Locale? getLocale() {
    String? _languageCode = sharedPreferences.getString(Constant.languageCode);
    String? _countryCode = sharedPreferences.getString(Constant.countryCode);
    if (_languageCode == null) return null;
    if (_countryCode == null) return null;
    Locale locale = Locale(_languageCode, _countryCode);
    return locale;
  }
}
