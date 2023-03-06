import 'dart:math';

import 'package:darurat/screens/widgets/alert_content.dart';
import 'package:darurat/screens/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class GlobalFunction {
  ///Clear all SnackBars and hide keyboard
  static void unFocus(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    ScaffoldMessenger.of(context).clearSnackBars();
  }

  ///ShowToast
  static void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black.withOpacity(.7),
      textColor: Colors.white,
      fontSize: 12,
    );
  }

  ///ShowToast Error
  static void showToastError(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red.withOpacity(.7),
      textColor: Colors.white,
      fontSize: 12,
    );
  }

  ///General API Handler
  // static void apiHandler(bool isSuccess, String msg, int statusCode) {
  //   if (!isSuccess) {
  //     showToast('$msg');
  //     if (statusCode == 401) {
  //       Provider.of<AuthProvider>(navigatorKey.currentState!.context, listen: false).logout(navigatorKey.currentState!.context);
  //     }
  //   }
  // }

  ///Regex
  static bool emailRegex(String email) {
    bool isValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return isValid;
  }

  static bool passwordRegex(String password) {
    bool isValid = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password);
    return isValid;
  }

  ///Check Permission
  static Future<void> checkPermissionAll() async {
    var _locationPermission = await Permission.location.status;
    var _cameraPermission = await Permission.camera.status;
    if (_locationPermission.isDenied) {
      _locationPermission = await Permission.location.request();
    }
    if (_cameraPermission.isDenied) {
      _cameraPermission = await Permission.camera.request();
    }
  }

  static Future<bool> checkLocationPermission() async {
    var _locationPermission = await Permission.location.status;
    if (_locationPermission.isDenied) {
      _locationPermission = await Permission.location.request();
    }
    if (_locationPermission.isPermanentlyDenied) {
      return false;
    }
    return _locationPermission.isGranted;
  }

  static Future<bool> checkCameraPermission() async {
    var _cameraPermission = await Permission.camera.status;
    if (_cameraPermission.isDenied) {
      _cameraPermission = await Permission.camera.request();
    }
    if (_cameraPermission.isPermanentlyDenied) {
      return false;
    }
    return true;
  }

  // static Future<void> checkConnection(VoidCallback callback) async {
  //   bool _isConnected = await NetworkInfo.isConnected();
  //   if(!_isConnected){
  //     scaffoldMessengerKey.currentState!.showSnackBar(SnackBars.internetError);
  //     return;
  //   }
  //   callback();
  //   return;
  // }

  /// [size] as in percentage.
  ///
  /// **Example:**
  ///
  /// AppConstants.flexibleWidth(context, 50)
  ///
  /// this will take 50% of the screen's width
  static double flexibleWidth(BuildContext context, double size) {
    final _size = size / 100;
    final width = MediaQuery.of(context).size.width * _size;
    return width;
  }

  /// [size] as in percentage.
  ///
  /// **Example:**
  ///
  /// AppConstants.flexibleHeight(context, 50)
  ///
  /// this will take 50% of the screen's height
  static double flexibleHeight(BuildContext context, double size) {
    final _size = size / 10;
    final height = MediaQuery.of(context).size.height * _size;
    return height;
  }

  static String formatNumber(int number) {
    return NumberFormat('###,###.###').format(number);
  }

  static Future<T?> showAlert<T extends Object?>({
    required BuildContext context,
    required String title,
    required String desc,
    final CustomButtonStyle customButtonStyle = CustomButtonStyle.filled,
    final Widget? content,
    final String? confirmText,
    final String? cancelText,
    final bool barrierDismissible = true,
    final bool dismissOnBack = true,
    final bool isSingleButton = false,
    final bool isReverseButton = false,
    final GestureTapCallback? onConfirm,
    final GestureTapCallback? onCancel,
  }) async {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
        return WillPopScope(
          onWillPop: () async {
            return dismissOnBack;
          },
          child: Center(
            child: AlertContent(
              title: title,
              desc: desc,
              content: content,
              confirmText: confirmText,
              cancelText: cancelText,
              isSingleButton: isSingleButton,
              isReverseButton: isReverseButton,
              customButtonStyle: customButtonStyle,
              onConfirm: onConfirm,
              onCancel: onCancel,
            ),
          ),
        );
      },
    );
  }

  // static Future<T?> showLoading<T extends Object?>({
  //   required BuildContext context,
  //   final bool barrierDismissible = true,
  //   final bool dismissOnBack = true,
  // }) async {
  //   return showGeneralDialog<T>(
  //     context: context,
  //     barrierDismissible: barrierDismissible,
  //     barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
  //     barrierColor: Colors.black45,
  //     transitionDuration: const Duration(milliseconds: 250),
  //     pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
  //       return WillPopScope(
  //         onWillPop: () async {
  //           return dismissOnBack;
  //         },
  //         child: Center(
  //             child: SizedBox(
  //               width: 40,
  //               height: 40,
  //               child: CircularProgressIndicator(
  //                 strokeWidth: 3,
  //                 color: primaryColor,
  //                 backgroundColor: textSecondary,
  //               ),
  //             )
  //         ),
  //       );
  //     },
  //   );
  // }

  ///Darken any color
  static Color darken(Color color, [double amount = .03]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static Future<String> loadJsonData(String jsonLocation) async {
    ///assets/darurat-4ff47-default-rtdb-export.json
    return await rootBundle.loadString(jsonLocation);
  }

  static Future<void> dialNumber(String phoneNumber) async {
    Uri _uri = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(_uri)) {
      await launchUrl(_uri);
    } else {
      throw 'Could not call $phoneNumber';
    }
  }

  static String randomAlpha(int length) {
    var rng = Random.secure();
    return String.fromCharCodes(Iterable.generate(
      length,
      (_) => rng.nextInt(26) + 65,
    )).toUpperCase();
  }

  static String generateUniqueID() {
    var now = DateTime.now();
    var minute = now.minute.toString().padLeft(2, '0');
    var hour = now.hour.toString().padLeft(2, '0');
    var date = DateFormat('ddMMyyyy').format(now);
    var unique = randomAlpha(4);
    var id = '$hour$minute$date$unique';
    return id;
  }
}
