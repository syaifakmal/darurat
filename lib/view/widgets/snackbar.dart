import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';

import '../../utils/fonts.dart.dart';

class SnackBars {
  static SnackBar internetError = SnackBar(
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
    duration: Duration(seconds: 3),
    content: Row(
      children: [
        Expanded(
          child: Text(
            'Could not connect to server, please check your internet connection',
            textAlign: TextAlign.left,
          ),
        ),
        TextButton(
          onPressed: () async {
            AppSettings.openWirelessSettings();
          },
          child: Text(
            'Settings',
            textAlign: TextAlign.center,
          ),
          style: TextButton.styleFrom(
            textStyle: Poppins.regular.copyWith(fontSize: 12),
          ),
        )
      ],
    ),
  );
}
