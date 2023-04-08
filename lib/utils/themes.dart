import 'package:darurat/utils/utils.dart';
import 'package:flutter/material.dart';

class Themes {
  static final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: black,
      scrolledUnderElevation: 0,
    ),
    primaryColor: black,
    hintColor: secondaryTextDark,
    backgroundColor: secondaryBackgroundDark,
    shadowColor: secondaryTextDark.withOpacity(.2),
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: white,
      onPrimary: white,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: blue,
      selectionColor: Colors.grey,
      selectionHandleColor: blue,
    ),
    scaffoldBackgroundColor: black,
  );

  static final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: white,
      scrolledUnderElevation: 0,
    ),
    primaryColor: white,
    hintColor: secondaryTextLight,
    shadowColor: secondaryTextDark.withOpacity(.5),
    backgroundColor: secondaryBackgroundLight,
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: black,
      onPrimary: black,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: blue,
      selectionColor: Colors.grey.shade400,
      selectionHandleColor: blue,
    ),
    // cursorColor: Colors.blue,
    scaffoldBackgroundColor: white,
  );
}
