import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darurat/data/datasource/emergency_db.dart';
import 'package:darurat/data/model/emergency_contact_model.dart';
import 'package:darurat/provider/data_provider.dart';
import 'package:darurat/utils/colors.dart';
import 'package:darurat/utils/constants.dart';
import 'package:darurat/utils/fonts.dart.dart';
import 'package:darurat/utils/images.dart';
import 'package:darurat/screens/widgets/card_widget.dart';
import 'package:darurat/screens/settings/settings.dart';
import 'package:darurat/screens/widgets/app_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late DataProvider _dataProvider;

  void _init() async {
    // log(json.encode(_allInfo));
  }

  @override
  void initState() {
    super.initState();
    _dataProvider = Provider.of<DataProvider>(context, listen: false);
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: themeProvider.theme,
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              titleSpacing: 0,
              elevation: .5,
              forceElevated: true,
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
                      onTap: () async {
                        CollectionReference doc = FirebaseFirestore.instance.collection(Constant.fireStore.emergencyContact);
                        print(doc.runtimeType);
                      },
                      tooltip: 'Add',
                      leftPadding: 8,
                      rightPadding: 4,
                    ),
                    AppBarIcon(
                      Images.iconMenu,
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen())),
                      tooltip: 'Settings',
                      leftPadding: 4,
                      rightPadding: 16,
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Column(
                      children: [
                        Text(_dataProvider.emergencyTypes[index], style: FontStyle.medium.copyWith(fontSize: 12),),
                      ],
                    );
                  }, childCount: _dataProvider.emergencyTypes.length)),
            )
            // SliverFillRemaining(
            //   hasScrollBody: false,
            //   child:
            //       // EmptyState(),
            //       Column(
            //     children: [
            //       for (var i = 0; i < list.length; i++)
            //         CardTile(
            //           onTap: null,
            //           color: Colors.red,
            //           title: list[i].name,
            //           subtitle: list[i].number,
            //         ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
