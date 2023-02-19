import 'package:darurat/utils/fonts.dart.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onBackPressed;
  final IconData? trailing;
  final double trailingSize;
  final VoidCallback? onTrailPressed;

  const CustomAppBar({
    Key? key,
    this.title,
    this.onBackPressed,
    this.trailing,
    this.onTrailPressed,
    this.trailingSize = 30,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      elevation: 1,
      shadowColor: Colors.black.withOpacity(.5),
      backgroundColor: Colors.white,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.onBackPressed != null
                ? Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: IconButton(
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          padding: EdgeInsets.zero,
                          onPressed: widget.onBackPressed,
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                : Container(),
            widget.title != null
                ? Text(
                    widget.title!,
                    style: FontStyle.medium.copyWith(fontSize: 16, color: Colors.black),
                  )
                : Container(),
            const Spacer(),
            widget.trailing != null
                ? IconButton(
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    iconSize: widget.trailingSize,
                    onPressed: widget.onTrailPressed,
                    icon: Icon(
                      widget.trailing,
                      color: Colors.black,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
