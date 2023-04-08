import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final Widget? child;
  final String image;
  final VoidCallback? onTap;
  final String? tooltip;
  final double leftPadding;
  final double rightPadding;
  final Color? color;

  const AppBarIcon(
    this.image, {
    this.onTap,
    this.tooltip,
    this.leftPadding = 0,
    this.rightPadding = 0,
    this.color,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? '',
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
          height: 56,
          child: Center(
            child: SizedBox(
              height: 34,
              width: 34,
              child: child ??
                  Image.asset(
                    image,
                    color: color ?? Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
