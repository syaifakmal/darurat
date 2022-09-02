import 'package:darurat/utils/colors.dart';
import 'package:darurat/utils/fonts.dart.dart';
import 'package:darurat/utils/images.dart';
import 'package:darurat/utils/size.dart';
import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final String? title;
  final String? subtitle;
  final String? icon;

  const CardTile({
    Key? key,
    required this.onTap,
    this.onLongPress,
    this.icon,
    required this.title,
    this.subtitle,
  }) : super(key: key);

  Widget _withIcon(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        color: white,
        width: Size.flexibleWidth(context, 100),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 34,
              width: 34,
              // margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                  image: AssetImage(icon ?? Images.iconPlaceholder),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              // color: Colors.orange,
              width: Size.flexibleWidth(context, 45),
              child: Text(
                title!,
                style: Poppins.semiBold.copyWith(fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
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
        color: white,
        width: Size.flexibleWidth(context, 100),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // color: Colors.orange,
              width: Size.flexibleWidth(context, 45),
              child: Text(
                title!,
                style: Poppins.semiBold.copyWith(fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              width: Size.flexibleWidth(context, 32),
              // color: Colors.greenAccent,
              child: Text(
                subtitle!,
                style: Poppins.regular.copyWith(fontSize: 14),
                textAlign: TextAlign.right,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
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
