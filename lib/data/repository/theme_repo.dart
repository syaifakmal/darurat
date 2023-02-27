import 'package:darurat/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepo {
  final SharedPreferences sharedPreferences;

  ThemeRepo({required this.sharedPreferences});

  Future<void> setTheme(bool isDarkMode) async {
    try {
      await sharedPreferences.setBool(Constant.isDarkMode, isDarkMode);
    } catch (e) {
      rethrow;
    }
  }

  bool getTheme() {
    return sharedPreferences.getBool(Constant.isDarkMode) ?? false;
  }
}
