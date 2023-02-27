import 'package:darurat/provider/theme_provider.dart';
import 'package:darurat/utils/colors.dart';
import 'package:darurat/utils/fonts.dart.dart';
import 'package:darurat/utils/global_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardTile extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Widget? leading;
  final Widget? trailing;
  final String? trailingText;
  final String? title;
  final String? subtitle;
  final String? icon;
  final String? icon2;
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
  }) : super(key: key);

  Widget _withIcon(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        // color: white,
        width: GlobalFunction.flexibleWidth(context, 100),
        padding: padding,
        height: 60,
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
              child: Container(
                // color: Colors.orange,
                // width: Size.flexibleWidth(context, 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title!,
                      style: Poppins.medium.copyWith(
                        fontSize: 14,
                        // color: themeProvider.textTheme,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle != null
                        ? Text(
                            subtitle!,
                            style: Poppins.regular.copyWith(
                              fontSize: 14,
                              // color: themeProvider.textTheme,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        : Container(),
                  ],
                ),
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
    );
  }

  Widget _withoutIcon(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        // color: white,
        width: GlobalFunction.flexibleWidth(context, 100),
        padding: padding,
        height: 60,
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                // color: Colors.orange,
                width: GlobalFunction.flexibleWidth(context, 50),
                child: Text(
                  title!,
                  style: Poppins.medium.copyWith(
                    fontSize: 14,
                    // color: themeProvider.textTheme,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: GlobalFunction.flexibleWidth(context, 32),
                // color: Colors.greenAccent,
                child: Text(
                  subtitle!,
                  style: Poppins.regular.copyWith(
                    fontSize: 14,
                    // color: themeProvider.textTheme,
                  ),
                  textAlign: TextAlign.right,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        child: _withIcon(context),
      ),
    );
  }
}
