import 'package:darurat/data/repository/theme_repo.dart';
import 'package:darurat/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeProvider extends ChangeNotifier {
  final ThemeRepo themeRepo;

  ThemeProvider({required this.themeRepo}) {
    init();
  }

  bool _isDarkMode = false;

  Color _theme = white;

  Color _textTheme = white;

  ThemeData _themes = Themes.lightTheme;

  ThemeData get themes => _themes;

  Color get theme => _theme;

  Color get textTheme => _textTheme;

  void init() {
    _isDarkMode = themeRepo.getTheme();
    _theme = _isDarkMode ? black : white;
    _textTheme = _isDarkMode ? white : black;
    // _themes = _isDarkMode ? Themes.darkTheme : Themes.lightTheme;
    notifyListeners();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarIconBrightness: _isDarkMode ? Brightness.light : Brightness.dark),
    );
  }

  void setTheme() {
    themeRepo.setTheme(!_isDarkMode);
    _isDarkMode = !_isDarkMode;
    _theme = _isDarkMode ? black : white;
    _textTheme = _isDarkMode ? white : black;
    // _themes = _isDarkMode ? Themes.darkTheme : Themes.lightTheme;
    notifyListeners();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarIconBrightness: _isDarkMode ? Brightness.light : Brightness.dark),
    );
  }
}

class Themes {
  static final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(color: black),
    scaffoldBackgroundColor: black,
    brightness: Brightness.dark,
    primaryColor: white,
  );

  static final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(color: white),
    scaffoldBackgroundColor: white,
    brightness: Brightness.light,
    primaryColor: black,
  );
}
