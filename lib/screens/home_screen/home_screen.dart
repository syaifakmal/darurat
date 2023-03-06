import 'package:darurat/data/model/emergency_contact_model.dart';
import 'package:darurat/data/model/emergency_type.dart';
import 'package:darurat/provider/data_provider.dart';
import 'package:darurat/screens/contact_form_screen/contact_form_screen.dart';
import 'package:darurat/screens/home_screen/widgets/list_emergency.dart';
import 'package:darurat/screens/widgets/card_widget.dart';
import 'package:darurat/screens/widgets/custom_button.dart';
import 'package:darurat/utils/fonts.dart.dart';
import 'package:darurat/utils/global_function.dart';
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
  late EmergencyContactProvider _emergencyContactProvider;

  List<EmergencyType> emergencyTypes = [];

  void _init() async {
    // log(json.encode(_allInfo));
  }

  void longPressContactDefault(EmergencyContact emergencyContact) {
    GlobalFunction.showAlert(
      context: context,
      isSingleButton: true,
      customButtonStyle: CustomButtonStyle.transparent,
      confirmText: 'Cancel',
      title: 'Options',
      desc: 'Choose from the following options to perform any action',
      onConfirm: () {
        Navigator.of(context).pop();
      },
      content: Column(
        children: [
          CardTile(
            onTap: () async {
              GlobalFunction.dialNumber(emergencyContact.number);
            },
            height: 50,
            title: 'Call This Contact',
            titleStyle: Poppins.medium.copyWith(fontSize: 12),
            icon: Images.iconCall,
          ),
          CardTile(
            onTap: () async {
              await _emergencyContactProvider.reportContact(emergencyContact);
            },
            height: 50,
            title: AppLocalizations.of(context)!.reportInactiveContact,
            titleStyle: Poppins.medium.copyWith(fontSize: 12),
            icon: Images.iconReportSmall,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _emergencyContactProvider = Provider.of<EmergencyContactProvider>(context, listen: false);
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
              elevation: 0,
              titleSpacing: 0,
              // backgroundColor: Colors.red,
              floating: true,
              // forceElevated: true,
              automaticallyImplyLeading: false,
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
                            builder: (context) => ContactFormScreen(title: AppLocalizations.of(context)!.addEmergencyContact),
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
                  listData: _emergencyContactProvider.emergencyContactList.where((emergency) => emergency.type == emergencyTypes[index].type).toList(),
                  title: emergencyTypes[index].title,
                  onLongPress: longPressContactDefault,
                );
              }, childCount: emergencyTypes.length),
            ),
            Consumer<EmergencyContactProvider>(builder: (context, emergencyContactProvider, child) {
              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return ListEmergency(
                    listData: emergencyContactProvider.userEmergencyContactList,
                    title: AppLocalizations.of(context)!.yourEmergencyContact,
                  );
                }, childCount: emergencyContactProvider.userEmergencyContactList.isNotEmpty ? 1 : 0),
              );
            }),
          ],
        ),
      ),
    );
  }
}
