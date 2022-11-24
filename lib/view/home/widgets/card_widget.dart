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
  final Color color;

  const CardTile({
    Key? key,
    required this.onTap,
    this.onLongPress,
    this.icon,
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
          builder: (context, themeProvider, child) =>  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 34,
                width: 34,
                child: Image.asset(
                  icon!,
                  color: themeProvider.textTheme,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                // color: Colors.orange,
                width: Size.flexibleWidth(context, 60),
                child: Text(
                  title!,
                  style: Poppins.semiBold.copyWith(fontSize: 14, color: themeProvider.textTheme),
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
              Container(
                // color: Colors.orange,
                width: Size.flexibleWidth(context, 45),
                child: Text(
                  title!,
                  style: Poppins.semiBold.copyWith(fontSize: 14,),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                width: Size.flexibleWidth(context, 32),
                // color: Colors.greenAccent,
                child: Text(
                  subtitle!,
                  style: Poppins.regular.copyWith(fontSize: 14, color: themeProvider.textTheme),
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
    if (icon != null) {
      return _withIcon(context);
    }
    return _withoutIcon(context);
  }
}
