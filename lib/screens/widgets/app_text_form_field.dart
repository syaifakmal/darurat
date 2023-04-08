import 'package:flutter/material.dart';
import 'package:darurat/utils/utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppTextFormField extends StatelessWidget {
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

  const AppTextFormField({
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
            if (value!.isEmpty) {
              return AppLocalizations.of(context)!.fieldRequired(labelText!);
            }
            return null;
          },
      onTap: onTap,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          bottom: 0,
        ),
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
      ),
    );
  }
}
