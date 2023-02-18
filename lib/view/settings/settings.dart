import 'package:darurat/provider/theme_provider.dart';
import 'package:darurat/utils/colors.dart';
import 'package:darurat/utils/fonts.dart.dart';
import 'package:darurat/utils/images.dart';
import 'package:darurat/utils/size.dart';
import 'package:darurat/view/widgets/card_widget.dart';
import 'package:darurat/view/widgets/app_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ThemeProvider? _themeProvider;

  @override
  void initState() {
    _themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              titleSpacing: 0,
              elevation: 0,
              floating: true,
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
                  Text('Settings', style: FontStyle.medium.copyWith(fontSize: 18))
                ],
              ),
            ),
            SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    CardTile(
                      onTap: () {
                        print('called');
                        _themeProvider!.setTheme();
                      },
                      icon: Images.iconMoon,
                      icon2: Images.iconSun,
                      title: 'Dark Mode',
                      // title: themeProvider.isDarkMode ? 'Light Mode' : 'Dark Mode',
                    ),
                    CardTile(onTap: null, icon: Images.iconLanguage, title: 'Language'),
                    CardTile(onTap: null, icon: Images.iconReport, title: 'Report Inactive Number'),
                    CardTile(onTap: null, icon: Images.iconUpload, title: 'Submit Emergency Number'),
                    CardTile(onTap: null, icon: Images.imageGithub, title: 'Github'),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
