import 'package:darurat/provider/data_provider.dart';
import 'package:darurat/provider/locale_provider.dart';
import 'package:darurat/screens/home_screen/home_screen.dart';
import 'package:darurat/utils/colors.dart';
import 'package:darurat/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late DataProvider _dataProvider;
  late LocaleProvider _localeProvider;

  void _init() async {
    await Future.delayed(const Duration(milliseconds: 500));
    await _localeProvider.initLocale();
    await _dataProvider.getData();
    await _dataProvider.checkVersion();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _dataProvider = Provider.of<DataProvider>(context, listen: false);
    _localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Image.asset(
          Images.imageLogoWithText,
          scale: 3,
        ),
      ),
    );
  }
}
