import 'package:darurat/utils/colors.dart';
import 'package:darurat/utils/fonts.dart.dart';
import 'package:darurat/utils/global_function.dart';
import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Widget? leading;
  final Widget? trailing;
  final String? trailingText;
  final String? title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final String? icon;
  final String? icon2;
  final double height;
  final bool switcher;
  final Color color;
  final EdgeInsetsGeometry padding;

  const CardTile({
    Key? key,
    required this.onTap,
    this.onLongPress,
    this.icon,
    this.icon2,
    this.leading,
    this.trailing,
    required this.title,
    this.subtitle,
    this.color = black,
    this.switcher = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.trailingText,
    this.height = 60,
    this.titleStyle = const TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w500),
    this.subtitleStyle = const TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w400),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          child: Container(
            // color: white,
            width: GlobalFunction.flexibleWidth(context, 100),
            padding: padding,
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                leading ?? Container(),
                icon != null
                    ? icon2 != null
                        ? SizedBox(
                            height: 34,
                            width: 34,
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: switcher
                                  ? Container(
                                      key: const Key('1'),
                                      child: Image.asset(
                                        icon!,
                                        color: black,
                                      ),
                                    )
                                  : Container(
                                      key: const Key('2'),
                                      child: Image.asset(
                                        icon2!,
                                        color: white,
                                      ),
                                    ),
                            ),
                          )
                        : SizedBox(
                            height: 34,
                            width: 34,
                            child: Image.asset(
                              icon!,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          )
                    : Container(),
                SizedBox(width: leading != null || icon != null ? 8 : 0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title!,
                        style: titleStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle != null
                          ? Text(
                              subtitle!,
                              style: subtitleStyle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(width: trailingText != null && trailing != null ? 8 : 0),
                trailingText != null
                    ? SizedBox(
                        width: GlobalFunction.flexibleWidth(context, 30),
                        // color: Colors.greenAccent,
                        child: Text(
                          trailingText!,
                          style: Poppins.regular.copyWith(
                            fontSize: 14,
                            // color: themeProvider.textTheme,
                          ),
                          textAlign: TextAlign.right,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : trailing ?? Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
