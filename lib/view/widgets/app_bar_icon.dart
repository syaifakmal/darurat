import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final String image;
  final VoidCallback? onTap;
  final String? tooltip;

  const AppBarIcon(
    this.image, {
    this.onTap,
    this.tooltip,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? '',
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 56,
          child: Center(
            child: Container(
              height: 34,
              width: 34,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
