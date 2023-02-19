import 'package:darurat/utils/fonts.dart.dart';
import 'package:flutter/material.dart';

class AlertContent extends StatefulWidget {
  final String title;
  final String subtitle;
  final String? confirmText;
  final String? cancelText;
  final bool isSingleButton;
  final bool isReverseButton;
  final GestureTapCallback? onConfirm;
  final GestureTapCallback? onCancel;

  const AlertContent({
    Key? key,
    required this.title,
    required this.subtitle,
    this.confirmText,
    this.cancelText,
    this.isSingleButton = false,
    this.isReverseButton = false,
    this.onConfirm,
    this.onCancel,
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
      borderRadius: BorderRadius.circular(6),
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width * .75,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(),
        child: Wrap(
          // direction: Axis.vertical,
          runSpacing: 5,
          alignment: WrapAlignment.center,
          // runAlignment: WrapAlignment.spaceAround,
          children: [
            Align(
              child: Text(
                widget.title,
                style: FontStyle.semiBold.copyWith(fontSize: 18, color: Colors.black87),
              ),
            ),
            Text(
              widget.subtitle,
              style: FontStyle.regular.copyWith(fontSize: 11, color: Colors.black87),
              textAlign: TextAlign.center,
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
