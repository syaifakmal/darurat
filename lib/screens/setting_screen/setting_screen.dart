import 'package:darurat/provider/theme_provider.dart';
import 'package:darurat/screens/language_setting_screen/language_setting_screen.dart';
import 'package:darurat/utils/fonts.dart.dart';
import 'package:darurat/utils/images.dart';
import 'package:darurat/screens/widgets/card_widget.dart';
import 'package:darurat/screens/widgets/app_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late ThemeProvider _themeProvider;

  @override
  void initState() {
    _themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBarIcon(
              Images.iconClose,
              onTap: () => Navigator.of(context).pop(),
              tooltip: 'Back',
              leftPadding: 16,
              rightPadding: 8,
            ),
            Text(
              AppLocalizations.of(context)!.setting,
              style: Poppins.medium.copyWith(fontSize: 18),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
                      return CardTile(
                        onTap: () {
                          themeProvider.setTheme();
                        },
                        switcher: !themeProvider.isDarkMode,
                        icon: Images.iconMoon,
                        icon2: Images.iconSun,
                        title: themeProvider.isDarkMode ? AppLocalizations.of(context)!.lightMode : AppLocalizations.of(context)!.darkMode,
                      );
                    }),
                    CardTile(
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
                    CardTile(onTap: null, icon: Images.iconReport, title: AppLocalizations.of(context)!.reportInactiveContact),
                    CardTile(onTap: null, icon: Images.iconUpload, title: AppLocalizations.of(context)!.submitContact),
                    CardTile(onTap: null, icon: Images.imageGithub, title: 'Github'),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
