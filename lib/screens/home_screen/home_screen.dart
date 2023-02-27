import 'package:darurat/data/model/emergency_type.dart';
import 'package:darurat/provider/data_provider.dart';
import 'package:darurat/screens/contact_form_screen/contact_form_screen.dart';
import 'package:darurat/screens/home_screen/widgets/list_emergency.dart';
import 'package:darurat/utils/fonts.dart.dart';
import 'package:darurat/utils/images.dart';
import 'package:darurat/screens/setting_screen/setting_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:darurat/screens/widgets/app_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DataProvider _dataProvider;

  List<EmergencyType> emergencyTypes = [];

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
    if (kDebugMode) {
      print('home_screen rebuilt');
    }
    emergencyTypes = [
      EmergencyType(title: AppLocalizations.of(context)!.emergency, type: 'emergency'),
      EmergencyType(title: AppLocalizations.of(context)!.mentalHelpHotline, type: 'mental help hotline'),
      EmergencyType(title: AppLocalizations.of(context)!.suicideHotline, type: 'suicide hotline'),
    ];
    return Scaffold(
      // backgroundColor: themeProvider.theme,
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              titleSpacing: 0,
              elevation: .5,
              forceElevated: true,
              floating: true,
              automaticallyImplyLeading: false,
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
                              hintText: AppLocalizations.of(context)!.search,
                              hintStyle: Poppins.regular.copyWith(fontSize: 14)),
                        ),
                      ),
                    ),
                    AppBarIcon(
                      Images.iconAdd,
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  ContactFormScreen(title: AppLocalizations.of(context)!.addEmergencyContact),
                          ),
                        );
                      },
                      tooltip: 'Add',
                      leftPadding: 8,
                      rightPadding: 4,
                    ),
                    AppBarIcon(
                      Images.iconMenu,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                      tooltip: AppLocalizations.of(context)!.setting,
                      leftPadding: 4,
                      rightPadding: 16,
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ListEmergency(
                  listData: _dataProvider.listData.where((emergency) => emergency.type == emergencyTypes[index].type).toList(),
                  title: emergencyTypes[index].title,
                );
              }, childCount: emergencyTypes.length),
            )
          ],
        ),
      ),
    );
  }
}
