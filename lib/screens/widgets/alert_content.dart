import 'package:darurat/screens/widgets/custom_button.dart';
import 'package:darurat/utils/colors.dart';
import 'package:darurat/utils/fonts.dart.dart';
import 'package:flutter/material.dart';


class AlertContent extends StatefulWidget {
  final String title;
  final String desc;
  final CustomButtonStyle customButtonStyle;
  final Widget? content;
  final String? confirmText;
  final String? cancelText;
  final bool isSingleButton;
  final bool isReverseButton;
  final GestureTapCallback? onConfirm;
  final GestureTapCallback? onCancel;

  const AlertContent({
    Key? key,
    required this.title,
    required this.desc,
    this.confirmText,
    this.cancelText,
    this.isSingleButton = false,
    this.isReverseButton = false,
    this.onConfirm,
    this.onCancel,
    this.content,
    this.customButtonStyle = CustomButtonStyle.filled,
  }) : super(key: key);

  @override
  State<AlertContent> createState() => _AlertContentState();
}

class _AlertContentState extends State<AlertContent> {
  late String _confirmText;
  late String _cancelText;

  GestureTapCallback? _onConfirm;
  GestureTapCallback? _onCancel;

  @override
  void initState() {
    _confirmText = widget.confirmText ?? 'Ok';
    _cancelText = widget.cancelText ?? 'Cancel';
    _onConfirm = widget.onConfirm;
    _onCancel = widget.onCancel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width * .75,
        padding: EdgeInsets.only(top: 20, bottom: 14),
        // decoration: BoxDecoration(),
        child: Wrap(
          // direction: Axis.vertical,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          // runAlignment: WrapAlignment.spaceAround,
          children: [
            Text(
              widget.title,
              style: Poppins.semiBold.copyWith(fontSize: 18, color: black),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.desc,
                style: Poppins.regular.copyWith(fontSize: 12, color: secondaryTextLight),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              width: double.infinity,
            ),
            widget.content ?? Container(),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 5),
              child: widget.isSingleButton
                  ? CustomButton(
                      buttonStyle: widget.customButtonStyle,
                      buttonText: _confirmText,
                      onTap: _onConfirm,
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            buttonStyle: CustomButtonStyle.filled,
                            buttonText: _confirmText,
                            onTap: _onConfirm,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomButton(
                            buttonStyle: CustomButtonStyle.transparent,
                            buttonText: _cancelText,
                            onTap: _onCancel,
                          ),
                        )
                      ],
                    ),
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 10),
            //   child: widget.isSingleButton
            //       ? Button(
            //           onTap: _onConfirm,
            //           buttonText: _confirmText,
            //         )
            //       : Row(
            //           children: [
            //             Expanded(
            //               child: Button(
            //                 padding: EdgeInsets.zero,
            //                 constraints: BoxConstraints(maxHeight: 40),
            //                 onTap: widget.isReverseButton ? _onConfirm : _onCancel,
            //                 buttonText: widget.isReverseButton ? _confirmText : _cancelText,
            //                 buttonType: widget.isReverseButton ? ButtonType.primary : ButtonType.secondary,
            //                 showBorder: false,
            //               ),
            //             ),
            //             SizedBox(width: 10),
            //             // Expanded(
            //             //   child: Button(
            //             //     padding: EdgeInsets.zero,
            //             //     constraints: BoxConstraints(maxHeight: 40),
            //             //     onTap: widget.isReverseButton ? _onCancel : _onConfirm,
            //             //     buttonText: widget.isReverseButton ? _cancelText : _confirmText,
            //             //     buttonType: widget.isReverseButton ? ButtonType.secondary : ButtonType.primary,
            //             //     showBorder: false,
            //             //   ),
            //             ),
            //           ],
            //         ),
            // )
          ],
        ),
      ),
    );
  }
}
