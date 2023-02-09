import 'dart:convert';
import 'dart:developer';

import 'package:darurat/provider/theme_provider.dart';
import 'package:darurat/utils/colors.dart';
import 'package:darurat/utils/constants.dart';
import 'package:darurat/utils/fonts.dart.dart';
import 'package:darurat/utils/global_function.dart';
import 'package:darurat/utils/images.dart';
import 'package:darurat/view/empty_state/empty_state.dart';
import 'package:darurat/view/widgets/card_widget.dart';
import 'package:darurat/view/settings/settings.dart';
import 'package:darurat/view/widgets/app_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final deviceInfoPlugin = DeviceInfoPlugin();
  late var _allInfo;
  String sdkVers = 'null';

  void getInfo() async {
    _allInfo = await deviceInfoPlugin.deviceInfo;
    _allInfo = _allInfo.toMap();
    setState(() {
      sdkVers = _allInfo['version']['sdkInt'].toString();
    });
    // log(json.encode(_allInfo));
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: themeProvider.theme,
      // resizeToAvoidBottomInset: false,
      body:
      SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              titleSpacing: 0,
              elevation: 1,
              forceElevated:true,
              floating: true,
              title: Padding(
                padding: EdgeInsets.only(left: 16),
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
                              fillColor: Theme.of(context).backgroundColor,
                              prefixIcon: Image.asset(
                                Images.iconSearch,
                                scale: 3.5,
                                color: Theme.of(context).hintColor,
                              ),
                              contentPadding: const EdgeInsets.only(right: 14),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Search',
                              hintStyle: FontStyle.regular.copyWith(fontSize: 14)),
                        ),
                      ),
                    ),
                    AppBarIcon(
                      Images.iconAdd,
                      onTap: () => debugPrint('tapped!'),
                      tooltip: 'Add',
                      leftPadding: 8,
                      rightPadding: 4,
                    ),
                    AppBarIcon(
                      Images.iconMenu,
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Settings())),
                      tooltip: 'Settings',
                      leftPadding: 4,
                      rightPadding: 16,
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child:
              // EmptyState(),
              Column(
                children: [
                  for (var i = 0; i < 20; i++)
                    CardTile(
                      onTap: null,
                      color: Colors.red,
                      title: sdkVers,
                      subtitle: 'subtitle',
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
