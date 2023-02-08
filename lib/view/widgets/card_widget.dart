import 'package:darurat/provider/theme_provider.dart';
import 'package:darurat/utils/colors.dart';
import 'package:darurat/utils/fonts.dart.dart';
import 'package:darurat/utils/images.dart';
import 'package:darurat/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardTile extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final String? title;
  final String? subtitle;
  final String? icon;
  final String? icon2;
  final Color color;

  const CardTile({
    Key? key,
    required this.onTap,
    this.onLongPress,
    this.icon,
    this.icon2,
    required this.title,
    this.subtitle,
    this.color = black,
  }) : super(key: key);

  Widget _withIcon(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        // color: white,
        width: Size.flexibleWidth(context, 100),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              icon2 != null
                  ? SizedBox(
                      height: 34,
                      width: 34,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: !themeProvider.isDarkMode
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
                    ),
              const SizedBox(width: 8),
              SizedBox(
                // color: Colors.orange,
                width: Size.flexibleWidth(context, 60),
                child: Text(
                  title!,
                  style: FontStyle.medium.copyWith(
                    fontSize: 14,
                    // color: themeProvider.textTheme,
                  ),
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

  Widget _withoutIcon(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        // color: white,
        width: Size.flexibleWidth(context, 100),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                // color: Colors.orange,
                width: Size.flexibleWidth(context, 45),
                child: Text(
                  title!,
                  style: FontStyle.medium.copyWith(
                    fontSize: 14,
                    // color: themeProvider.textTheme,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: Size.flexibleWidth(context, 32),
                // color: Colors.greenAccent,
                child: Text(
                  subtitle!,
                  style: FontStyle.regular.copyWith(
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
        child: icon != null ? _withIcon(context) : _withoutIcon(context),
      ),
    );
    if (icon != null) {
      return _withIcon(context);
    }
    return _withoutIcon(context);
  }
}
