import 'package:darurat/screens/splash_screen/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'di_container.dart' as di;
import 'l10n/l10n.dart';
import 'provider/provider.dart';
import 'utils/utils.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<EmergencyContactProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<LocaleProvider>()),
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
    final LocaleProvider _localProvider = Provider.of<LocaleProvider>(context);
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      themeMode: _themeProvider.themeMode,
      darkTheme: Themes.darkTheme,
      theme: Themes.lightTheme,
      locale: _localProvider.locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
    );
  }
}
