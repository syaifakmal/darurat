import 'package:darurat/screens/widgets/alert_content.dart';
import 'package:darurat/screens/widgets/card_widget.dart';
import 'package:darurat/utils/images.dart';
import 'package:flutter/material.dart';

class _DefaultContactAlert extends StatelessWidget {
  final String title;
  final String desc;

  const _DefaultContactAlert({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertContent(
      title: title,
      desc: desc,
      content:
      Column(
        children: [
          CardTile(
            onTap: () async {},
            onLongPress: () {},
            height: 50,
            title: 'Call This Contact',
            icon: Images.iconCall,
          ),
          CardTile(
            onTap: () async {},
            onLongPress: () {},
            height: 50,
            title: 'Call This Contact',
            icon: Images.iconReportSmall,
          ),
        ],
      ),
    );
  }
}
