import 'package:darurat/main.dart';
import 'package:darurat/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';

class SnackBars {
  static SnackBar internetError = SnackBar(
    backgroundColor: black,
    behavior: SnackBarBehavior.floating,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
    duration: const Duration(seconds: 3),
    content: Row(
      children: [
        Expanded(
          child: Text(
            AppLocalizations.of(navigatorKey.currentState!.context)!.internetError,
            style: Poppins.regular.copyWith(fontSize: 12, color: white),
            maxLines: 1,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        TextButton(
          onPressed: () async {
            AppSettings.openWirelessSettings();
          },
          child: Text(
            AppLocalizations.of(navigatorKey.currentState!.context)!.setting,
            maxLines: 1,
            style: Poppins.regular.copyWith(fontSize: 12, color: blue),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          style: TextButton.styleFrom(
              // textStyle: Poppins.regular.copyWith(fontSize: 12),
              ),
        )
      ],
    ),
  );
}
