import 'package:darurat/utils/colors.dart';
import 'package:darurat/utils/fonts.dart.dart';
import 'package:darurat/utils/images.dart';
import 'package:darurat/utils/size.dart';
import 'package:darurat/view/home/widgets/card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: slightGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Images.imageLogo,
            scale: 3,
          ),
          const SizedBox(height: 10),
          Text(
            'No result found for “test”.',
            style: Poppins.medium.copyWith(fontSize: 13, color: grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 3),
          Text(
            'Try searching for service name or number\nE. g. “Police”',
            style: Poppins.medium.copyWith(fontSize: 13, color: grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
