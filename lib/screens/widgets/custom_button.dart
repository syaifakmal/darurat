import 'package:darurat/utils/colors.dart';
import 'package:darurat/utils/global_function.dart';
import 'package:flutter/material.dart';

enum CustomButtonStyle {
  filled,
  boxed,
  transparent
}

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? buttonText;
  final TextStyle? textStyle;
  final CustomButtonStyle buttonStyle;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? textColor;
  final bool? isLoading;
  final double? buttonWidth;

  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
    this.textStyle = const TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w400),
    this.buttonWidth,
    this.buttonStyle = CustomButtonStyle.filled,
    this.buttonColor = red,
    this.borderColor = red,
    this.textColor = white,
    this.isLoading = false,
  }) : super(key: key);

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    getColor(Set<MaterialState> states) {
      if (buttonStyle == CustomButtonStyle.filled) {
        if (states.contains(MaterialState.pressed)) {
          return colorPressed;
        } else {
          return color;
        }
      } else {
        if (states.contains(MaterialState.pressed)) {
          return GlobalFunction.darken(white, .001);
        } else {
          return white;
        }
      }
    }

    return MaterialStateProperty.resolveWith((getColor));
  }

  MaterialStateProperty<Color> getColorText(Color color, Color colorPressed) {
    getColor(Set<MaterialState> states) {
      if (buttonStyle == CustomButtonStyle.filled) {
        if (states.contains(MaterialState.pressed)) {
          return colorPressed;
        } else {
          return color;
        }
      } else {
        if (states.contains(MaterialState.pressed)) {
          return GlobalFunction.darken(buttonColor!);
        } else {
          return buttonColor!;
        }
      }
    }

    return MaterialStateProperty.resolveWith((getColor));
  }

  MaterialStateProperty<BorderSide> getColorBorder(Color color, Color colorPressed) {
    getColor(Set<MaterialState> states) {
      if (buttonStyle == CustomButtonStyle.filled) {
        return BorderSide(
          color: buttonColor!,
        );

      } else if(buttonStyle == CustomButtonStyle.boxed){
        if (states.contains(MaterialState.pressed)) {
          return BorderSide(
            color: colorPressed,
          );
        } else {
          return BorderSide(
            color: color,
          );
        }
      } else {
        return const BorderSide(
          color: Colors.transparent,
        );
      }
    }

    return MaterialStateProperty.resolveWith((getColor));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      child: TextButton(
        onPressed: onTap!,
        style: ButtonStyle(
          animationDuration: const Duration(microseconds: 2),
          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 15)),
          visualDensity: VisualDensity.compact,
          backgroundColor: MaterialStateProperty.all<Color?>(buttonStyle == CustomButtonStyle.filled ? buttonColor : white),
          foregroundColor: getColorText(textColor!, textColor!),
          splashFactory: NoSplash.splashFactory,
          side: getColorBorder(buttonColor!, GlobalFunction.darken(buttonColor!)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
            // side: BorderSide(color: buttonColor!)
          )),
        ),
        // TextButton.styleFrom(
        //   padding: const EdgeInsets.all(0),
        //   splashFactory: NoSplash.splashFactory,
        //   primary: Colors.red,
        //   backgroundColor: getColor(buttonColor!, Colors.white)
        // ),
        child: Container(
          // height: 10,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            // color: red,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(buttonStyle == CustomButtonStyle.filled ? 0.2 : 0),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 1),
              ), // changes position of shadow
            ],
            // gradient: (Provider.of<ThemeProvider>(context).darkTheme || onTap == null) ? null : isBuy?
            // LinearGradient(colors: [
            //   Color(0xffFE961C),
            //   Color(0xffFE961C),
            //   Color(0xffFE961C),
            // ]):
            // LinearGradient(colors: [
            //   Theme.of(context).primaryColor,
            //   Theme.of(context).primaryColor,
            //   Theme.of(context).primaryColor,
            // ]),
            // border: Border.all(color: borderColor!, width: 1),
            // borderRadius: BorderRadius.circular(10),
          ),
          child: isLoading!
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: white,
                  ),
                )
              : Text(
                  buttonText!,
                  style: textStyle,
                ),
        ),
      ),
    );
  }
}
