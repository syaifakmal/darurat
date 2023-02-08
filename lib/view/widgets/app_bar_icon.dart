import 'package:darurat/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarIcon extends StatelessWidget {
  final String image;
  final VoidCallback? onTap;
  final String? tooltip;
  final double leftPadding;
  final double rightPadding;

  const AppBarIcon(
    this.image, {
    this.onTap,
    this.tooltip,
    this.leftPadding = 0,
    this.rightPadding = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? '',
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
          height: 56,
          child: Center(
            child: Container(
              height: 34,
              width: 34,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage(image),
              //   ),
              // ),
              child: Image.asset(
                image,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}