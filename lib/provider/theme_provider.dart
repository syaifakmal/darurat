import 'package:darurat/data/repository/theme_repo.dart';
import 'package:darurat/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeProvider extends ChangeNotifier {
  final ThemeRepo themeRepo;

  ThemeProvider({required this.themeRepo}) {
    _init();
  }

  bool _isDarkMode = false;

  ThemeMode? _themeMode;

  ThemeMode? get themeMode => _themeMode;

  bool get isDarkMode => _isDarkMode;

  void _init() {
    _isDarkMode = themeRepo.getTheme();
      _themeMode = _isDarkMode ? ThemeMode.dark : ThemeMode.light;
    // _themes = _isDarkMode ? Themes.darkTheme : Themes.lightTheme;
    notifyListeners();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:_isDarkMode ? Brightness.light : Brightness.dark ,
        systemNavigationBarColor: _isDarkMode ? black : white,
        systemNavigationBarIconBrightness: _isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );
  }

  void setTheme() {
    _isDarkMode = !_isDarkMode;
    themeRepo.setTheme(_isDarkMode);
    _themeMode = _isDarkMode ? ThemeMode.dark : ThemeMode.light;
    // _themes = _isDarkMode ? Themes.darkTheme : Themes.lightTheme;
    notifyListeners();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        // statusBarIconBrightness:_isDarkMode ? Brightness.light : Brightness.dark ,
        systemNavigationBarColor: _isDarkMode ? black : white,
        systemNavigationBarIconBrightness: _isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );
  }
}


