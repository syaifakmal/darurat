import 'package:flutter/material.dart';

class Size {
  /// [size] as in percentage.
  ///
  /// **Example:**
  ///
  /// AppConstants.flexibleWidth(context, 50)
  ///
  /// this will take 50% of the screen's width
  static double flexibleWidth(BuildContext context, double size){
    final _size = size/100;
    final width =  MediaQuery.of(context).size.width * _size;
    return width;
  }

  /// [size] as in percentage.
  ///
  /// **Example:**
  ///
  /// AppConstants.flexibleHeight(context, 50)
  ///
  /// this will take 50% of the screen's height
  static double flexibleHeight(BuildContext context, double size){
    final _size = size/10;
    final height =  MediaQuery.of(context).size.height * _size;
    return height;
  }
}

class FontSize {
  static const double ten = 10.0;
  static const double twelve = 12.0;
  static const double fourthTeen = 14.0;
  static const double sixthTeen = 16.0;
  static const double eightTeen = 18.0;
  static const double twentyFour = 24.0;
}