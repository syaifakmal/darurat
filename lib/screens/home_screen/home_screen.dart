import 'package:darurat/data/model/model.dart';
import 'package:darurat/provider/provider.dart';
import 'package:darurat/screens/contact_form_screen/contact_form_screen.dart';
import 'package:darurat/screens/widgets/widgets.dart';
import 'package:darurat/utils/utils.dart';
import 'package:darurat/screens/setting_screen/setting_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';

part 'widgets/list_emergency.dart';

part 'widgets/empty_state.dart';

part 'widgets/search_app_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchContactController = TextEditingController();

  late EmergencyContactProvider _emergencyContactProvider;

  List<EmergencyType> emergencyTypes = [];

  void longPressContactDefault(EmergencyContact emergencyContact) {
    if (emergencyContact.type == 'user emergency contact') {
      return longPressUserContact(emergencyContact);
    }
    GlobalFunction.showAlert(
      context: context,
      isSingleButton: true,
      customButtonStyle: AppButtonStyle.transparent,
      confirmText: AppLocalizations.of(context)!.cancel,
      title: AppLocalizations.of(context)!.options,
      desc: AppLocalizations.of(context)!.optionsDesc,
      onConfirm: () {
        Navigator.of(context).pop();
      },
      content: Column(
        children: [
          AppCard(
            onTap: () async {
              GlobalFunction.dialNumber(emergencyContact.number);
            },
            height: 50,
            title: AppLocalizations.of(context)!.callThisContact,
            titleStyle: Poppins.medium.copyWith(fontSize: 12),
            icon: Images.iconCall,
          ),
          AppCard(
            onTap: () async {
              GlobalFunction.checkConnection(() async {
                GlobalFunction.showLoading(context: context);
                try {
                  await _emergencyContactProvider.reportContact(emergencyContact);
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  GlobalFunction.showAlert(
                    context: context,
                    title: AppLocalizations.of(context)!.contactReported,
                    desc: AppLocalizations.of(context)!.contactReportedDesc,
                    isSingleButton: true,
                    customButtonStyle: AppButtonStyle.transparent,
                    onConfirm: () {
                      Navigator.of(context).pop();
                    },
                  );
                } catch (e) {
                  if (kDebugMode) {
                    print(e);
                  }
                  Navigator.of(context).pop();
                  GlobalFunction.showToast(AppLocalizations.of(context)!.reportContactFailed);
                }
              });
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

  void longPressUserContact(EmergencyContact emergencyContact) {
    GlobalFunction.showAlert(
      context: context,
      isSingleButton: true,
      customButtonStyle: AppButtonStyle.transparent,
      confirmText: AppLocalizations.of(context)!.cancel,
      title: AppLocalizations.of(context)!.options,
      desc: AppLocalizations.of(context)!.optionsDesc,
      onConfirm: () {
        Navigator.of(context).pop();
      },
      content: Column(
        children: [
          AppCard(
            onTap: () async {
              GlobalFunction.dialNumber(emergencyContact.number);
            },
            height: 50,
            title: AppLocalizations.of(context)!.callThisContact,
            titleStyle: Poppins.medium.copyWith(fontSize: 12),
            icon: Images.iconCall,
          ),
          AppCard(
            onTap: () async {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactFormScreen(
                    title: AppLocalizations.of(context)!.editContact,
                    emergencyContact: emergencyContact,
                  ),
                ),
              );
            },
            height: 50,
            title: AppLocalizations.of(context)!.editContact,
            titleStyle: Poppins.medium.copyWith(fontSize: 12),
            icon: Images.iconEdit,
          ),
          AppCard(
            onTap: () async {
              GlobalFunction.showAlert<bool>(
                  context: context,
                  title: AppLocalizations.of(context)!.shareYourContact,
                  desc: AppLocalizations.of(context)!.shareYourContactDesc,
                  onConfirm: () {
                    Navigator.of(context).pop(true);
                  }).then((value) {
                if (value == null) return;
                if (value) {
                  GlobalFunction.checkConnection(() async {
                    GlobalFunction.showLoading(context: context);
                    try {
                      await _emergencyContactProvider.shareContact(emergencyContact);
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      GlobalFunction.showAlert(
                        context: context,
                        title: AppLocalizations.of(context)!.thankYou,
                        desc: AppLocalizations.of(context)!.thankYouContactShared,
                        isSingleButton: true,
                        customButtonStyle: AppButtonStyle.transparent,
                        onConfirm: () {
                          Navigator.of(context).pop();
                        },
                      );
                    } catch (e) {
                      if (kDebugMode) {
                        print(e);
                      }
                      GlobalFunction.showToast(AppLocalizations.of(context)!.sharingContactFailed);
                      Navigator.of(context).pop();
                    }
                  });
                }
              });
            },
            height: 50,
            title: AppLocalizations.of(context)!.shareContact,
            titleStyle: Poppins.medium.copyWith(fontSize: 12),
            icon: Images.iconShare,
          ),
          AppCard(
            onTap: () async {
              GlobalFunction.showAlert<bool>(
                context: context,
                customButtonStyle: AppButtonStyle.transparent,
                confirmText: AppLocalizations.of(context)!.deleteContact,
                title: AppLocalizations.of(context)!.deleteContact,
                desc: AppLocalizations.of(context)!.deleteContactDesc,
                cancelText: AppLocalizations.of(context)!.cancel,
                onConfirm: () {
                  _emergencyContactProvider.deleteUserEmergencyContact(emergencyContact);
                  Navigator.of(context).pop(true);
                },
              ).then((value) {
                if (value != null) {
                  if (value) {
                    Navigator.of(context).pop();
                  }
                }
              });
              // _emergencyContactProvider.deleteUserEmergencyContact(emergencyContact);
              // Navigator.of(context).pop();
            },
            height: 50,
            title: AppLocalizations.of(context)!.deleteContact,
            titleStyle: Poppins.medium.copyWith(fontSize: 12),
            icon: Images.iconTrash,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _emergencyContactProvider = Provider.of<EmergencyContactProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    emergencyTypes = [
      EmergencyType(title: AppLocalizations.of(context)!.emergency, type: 'emergency'),
      EmergencyType(title: AppLocalizations.of(context)!.mentalHelpHotline, type: 'mental help hotline'),
      EmergencyType(title: AppLocalizations.of(context)!.suicideHotline, type: 'suicide hotline'),
    ];
    return GestureDetector(
      onTap: () => GlobalFunction.unFocus(context),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              _SearchAppBar(
                searchController: _searchContactController,
                onSearch: (value) {
                  _emergencyContactProvider.searchContact(value);
                },
              ),
              Consumer<EmergencyContactProvider>(
                builder: (context, emergencyContactProvider, child) {
                  return _searchContactController.text == ''
                      ? MultiSliver(children: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate((context, index) {
                              return _ListEmergency(
                                listData: _emergencyContactProvider.emergencyContactList.where((emergency) => emergency.type == emergencyTypes[index].type).toList(),
                                title: emergencyTypes[index].title,
                                onLongPress: longPressContactDefault,
                              );
                            }, childCount: emergencyTypes.length),
                          ),
                          Consumer<EmergencyContactProvider>(builder: (context, emergencyContactProvider, child) {
                            return SliverList(
                              delegate: SliverChildBuilderDelegate((context, index) {
                                return _ListEmergency(
                                  onLongPress: longPressUserContact,
                                  listData: emergencyContactProvider.userEmergencyContactList,
                                  title: AppLocalizations.of(context)!.yourEmergencyContact,
                                );
                              }, childCount: emergencyContactProvider.userEmergencyContactList.isNotEmpty ? 1 : 0),
                            );
                          }),
                        ])
                      : emergencyContactProvider.foundSearchContact.isNotEmpty
                          ? SliverList(
                              delegate: SliverChildBuilderDelegate((context, index) {
                                return _ListEmergency(
                                  listData: emergencyContactProvider.foundSearchContact,
                                  title: AppLocalizations.of(context)!.searchResult,
                                  onLongPress: longPressContactDefault,
                                );
                              }, childCount: 1),
                            )
                          : SliverFillRemaining(
                              child: GestureDetector(
                                onTap: () {
                                  GlobalFunction.unFocus(context);
                                },
                                child: _EmptyState(
                                  searchText: emergencyContactProvider.searchContactText!,
                                ),
                              ),
                            );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
