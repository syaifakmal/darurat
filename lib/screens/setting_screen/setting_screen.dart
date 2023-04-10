import 'package:darurat/provider/provider.dart';
import 'package:darurat/screens/language_setting_screen/language_setting_screen.dart';
import 'package:darurat/screens/widgets/widgets.dart';
import 'package:darurat/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: AppLocalizations.of(context)!.setting,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
                return AppCard(
                  onTap: () {
                    themeProvider.setTheme();
                  },
                  switcher: !themeProvider.isDarkMode,
                  icon: Images.iconMoon,
                  icon2: Images.iconSun,
                  title: themeProvider.isDarkMode ? AppLocalizations.of(context)!.lightMode : AppLocalizations.of(context)!.darkMode,
                );
              }),
              AppCard(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LanguageSettingScreen(),
                    ),
                  );
                },
                icon: Images.iconLanguage,
                title: AppLocalizations.of(context)!.languageSetting,
              ),
              AppCard(
                onTap: () async {
                  final theme = Theme.of(context);
                  try {
                     launch(
                      'https://github.com/syaifakmal/darurat',
                      customTabsOption: CustomTabsOption(
                        toolbarColor: theme.primaryColor,
                        enableDefaultShare: false,
                        enableUrlBarHiding: true,
                        showPageTitle: true,
                        animation: CustomTabsSystemAnimation.slideIn(),
                        extraCustomTabs: const <String>[
                          'org.mozilla.firefox',
                          'com.microsoft.emmx',
                        ],
                      ),
                      safariVCOption: SafariViewControllerOption(
                        preferredBarTintColor: theme.primaryColor,
                        preferredControlTintColor: Colors.white,
                        barCollapsingEnabled: true,
                        entersReaderIfAvailable: false,
                        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
                      ),
                    );
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                },
                icon: Images.imageGithub,
                title: 'Github',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
