import 'package:darurat/utils/fonts.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String prefixText;
  final String hintText;
  final String? labelText;
  final String? suffixText;
  final double prefixWidth;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextCapitalization textCapitalization;
  final TextInputType textInputType;
  final bool readOnly;
  final int? maxLength;
  final int? maxLines;
  final EdgeInsets padding;
  final List<TextInputFormatter> inputFormatters;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.prefixText = '',
    this.hintText = '',
    this.suffixText,
    this.labelText,
    this.prefixWidth = 100,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.readOnly = false,
    this.validator,
    this.textCapitalization = TextCapitalization.sentences,
    this.textInputType = TextInputType.text,
    this.maxLength,
    this.maxLines = 1,
    this.padding = EdgeInsets.zero,
    this.inputFormatters = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      textCapitalization: textCapitalization,
      style: Poppins.regular.copyWith(fontSize: 14),
      // cursorColor: primaryColor,
      controller: controller ?? TextEditingController(),
      readOnly: readOnly,
      maxLength: maxLength,
      maxLines: maxLines,
      validator: validator ??
          (value) {
            // String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
            // RegExp regex = RegExp(pattern);
            if (value!.isEmpty) {
              return 'Kolom $prefixText dibutuhkan';
            }
            // if (value.isNotEmpty && !regex.hasMatch(value)) {
            //   return 'Please enter a valid email';
            // }
            return null;
          },
      onTap: onTap,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        // contentPadding: EdgeInsets.only(
        //   top: padding.top != 0 ? padding.top : 15,
        //   bottom: padding.bottom != 0 ? padding.bottom : 15,
        //   left: padding.left != 0 ? padding.left : 0,
        //   right: padding.right != 0 ? padding.right : 10,
        // ),
        // focusColor: primaryColor,
        filled: false,
        fillColor: Colors.yellow,
        counterText: "",
        prefixIcon: prefixText != ''
            ? Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  prefixText,
                  style: Poppins.regular.copyWith(fontSize: 12, color: const Color(0xFF6F6F6F)),
                ),
              )
            : null,
        prefixIconConstraints: BoxConstraints(minWidth: prefixWidth, minHeight: 0),
        suffixIcon: suffixIcon,
        suffixText: suffixIcon == null ? suffixText : null,
        suffixStyle: Poppins.regular.copyWith(fontSize: 12, color: const Color(0xFF6F6F6F)),
        labelText: labelText,
        labelStyle: Poppins.regular.copyWith(fontSize: 14),
        floatingLabelStyle: Poppins.regular.copyWith(fontSize: 16),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintText: hintText,
        hintStyle: Poppins.regular.copyWith(fontSize: 12, color: const Color(0xFFB0B0B0)),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(6),
        //   // borderSide: const BorderSide(color: primaryColor),
        // ),
        // errorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(6),
        //   borderSide: const BorderSide(color: Colors.red),
        // ),
        // focusedErrorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(6),
        //   borderSide: const BorderSide(color: Colors.red),
        // ),
        // disabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(6),
        //   borderSide: const BorderSide(color: Color(0xFFE7E7E7)),
        // ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(6),
        //   borderSide: const BorderSide(color: Color(0xFFE7E7E7)),
        // ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(6),
        //   borderSide: const BorderSide(color: Color(0xFFE7E7E7)),
        // ),
      ),
    );
  }
}
