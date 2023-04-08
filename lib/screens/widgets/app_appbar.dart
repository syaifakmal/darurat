import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:darurat/utils/utils.dart';
import 'package:flutter/material.dart';

import 'app_bar_icon.dart';

class AppAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;

  const AppAppBar({
    Key? key,
    required this.title,
    this.leading, this.trailing,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _AppAppBarState createState() => _AppAppBarState();
}

class _AppAppBarState extends State<AppAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).shadowColor,
                width: 1,
              ),
            ),
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.leading ??
              AppBarIcon(
                Images.iconClose,
                onTap: () => Navigator.of(context).pop(),
                tooltip: AppLocalizations.of(context)!.back,
                leftPadding: 16,
                rightPadding: 8,
              ),
          Expanded(
            child: Text(
              widget.title,
              style: Poppins.medium.copyWith(fontSize: 18),
            ),
          ),
          widget.trailing ?? Container(),
        ],
      ),
    );
  }
}
