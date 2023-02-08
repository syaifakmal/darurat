import 'package:darurat/data/repository/theme_repo.dart';
import 'package:darurat/provider/theme_provider.dart';
import 'package:darurat/utils/themes.dart';
import 'package:darurat/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     statusBarIconBrightness:  Brightness.dark,
  //     // systemNavigationBarColor: _isDarkMode ? black : white,
  //     // systemNavigationBarIconBrightness: _isDarkMode ? Brightness.light : Brightness.dark,
  //   ),
  // );
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(themeRepo: ThemeRepo(sharedPreferences))),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      themeMode: _themeProvider.themeMode,
      darkTheme: Themes.darkTheme,
      theme: Themes.lightTheme,
    );
  }
}
