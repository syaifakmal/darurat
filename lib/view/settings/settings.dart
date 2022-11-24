import 'package:darurat/provider/theme_provider.dart';
import 'package:darurat/utils/colors.dart';
import 'package:darurat/utils/fonts.dart.dart';
import 'package:darurat/utils/images.dart';
import 'package:darurat/utils/size.dart';
import 'package:darurat/view/home/widgets/card_widget.dart';
import 'package:darurat/view/widgets/app_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  ThemeProvider? _themeProvider;

  @override
  void initState() {
    _themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) => Scaffold(
        // backgroundColor: themeProvider.theme,
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          color: themeProvider.theme,
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  titleSpacing: 0,
                  elevation: 0,
                  floating: true,
                  title: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    color: themeProvider.theme,
                    child: Row(
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
                        Text('Settings', style: Poppins.medium.copyWith(fontSize: 18, color: themeProvider.textTheme))
                      ],
                    ),
                  ),
                ),
                SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        CardTile(onTap: () {
                          _themeProvider!.setTheme();
                        }, icon: Images.iconMoon, title: 'Dark Mode'),
                        CardTile(onTap: null, icon: Images.iconLanguage, title: 'Language'),
                        CardTile(onTap: null, icon: Images.iconReport, title: 'Report Inactive Number'),
                        CardTile(onTap: null, icon: Images.iconUpload, title: 'Submit Emergency Number'),
                        CardTile(onTap: null, icon: Images.imageGithub, title: 'Github'),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
