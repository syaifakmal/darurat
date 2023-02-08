import 'package:darurat/utils/colors.dart';
import 'package:flutter/material.dart';

class Themes {
  static final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(color: black),
    primaryColor: black,
    hintColor: secondaryTextDark,
    backgroundColor: secondaryBackgroundDark,
    colorScheme: const ColorScheme.dark(
      primary: Colors.red,
      onPrimary: white,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: red,
      selectionColor: Colors.grey,
      selectionHandleColor: red,
    ),
    scaffoldBackgroundColor: black,
  );

  static final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(color: white),
    primaryColor: white,
    hintColor: secondaryTextLight,
    backgroundColor: secondaryBackgroundLight,
    colorScheme: const ColorScheme.light(
      primary: red,
      onPrimary: black,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: red,
      selectionColor: Colors.grey.shade400,
      selectionHandleColor: red,
    ),
    // cursorColor: Colors.blue,
    scaffoldBackgroundColor: white,
  );
}
