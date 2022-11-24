import 'package:flutter/material.dart';

class GlobalFunction {
  ///Clear all SnackBars and hide keyboard
  static void unFocus(context){
    FocusManager.instance.primaryFocus?.unfocus();
    ScaffoldMessenger.of(context).clearSnackBars();
  }

  ///Darken any color
  static Color darken(Color color, [double amount = .03]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }
}