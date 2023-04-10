import 'package:darurat/provider/provider.dart';
import 'package:darurat/screens/home_screen/home_screen.dart';
import 'package:darurat/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late EmergencyContactProvider _dataProvider;
  late LocaleProvider _localeProvider;
  late ThemeProvider _themeProvider;

  void _init() async {
    await Future.delayed(const Duration(milliseconds: 500));
    await _localeProvider.initLocale();
    await _dataProvider.getData();

    GlobalFunction.checkConnection(
      () async {
        await _dataProvider.checkVersion().timeout(const Duration(seconds: 5));
      },
      showSnackBar: false,
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _dataProvider = Provider.of<EmergencyContactProvider>(context, listen: false);
    _themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    _localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          _themeProvider.isDarkMode ? Images.imageLogoWithTextLight : Images.imageLogoWithText,
          scale: 3,
        ),
      ),
    );
  }
}
