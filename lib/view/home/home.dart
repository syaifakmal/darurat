import 'package:darurat/utils/colors.dart';
import 'package:darurat/utils/fonts.dart.dart';
import 'package:darurat/utils/images.dart';
import 'package:darurat/utils/size.dart';
import 'package:darurat/view/empty_state/empty_state.dart';
import 'package:darurat/view/home/widgets/card_widget.dart';
import 'package:darurat/view/options/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/app_bar_icon.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: white,
              titleSpacing: 0,
              elevation: 0,
              floating: true,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 34,
                        child: TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: lightGrey,
                              prefixIcon: Image.asset(Images.iconSearch, scale: 3.5),
                              contentPadding: EdgeInsets.only(right: 14.w),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Search',
                              hintStyle: Poppins.regular.copyWith(fontSize: 15, color: grey)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    AppBarIcon(
                      Images.iconAdd,
                      onTap: () => print('tapped!'),
                      tooltip: 'Add',
                    ),
                    const SizedBox(width: 8),
                    AppBarIcon(
                      Images.iconMenu,
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Settings())),
                      tooltip: 'Settings',
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  for(var i = 0; i < 100; i++) CardTile(onTap: null, title: 'aasdasdasdasd', subtitle: 'subtitle')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
