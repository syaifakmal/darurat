import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:darurat/data/repository/language_repo.dart';
import 'package:darurat/data/repository/theme_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'provider/provider.dart';
import 'utils/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => ThemeRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => LocaleRepo(sharedPreferences: sl()));

  sl.registerFactory(() => ThemeProvider(themeRepo: sl()));
  sl.registerFactory(() => EmergencyContactProvider());
  sl.registerFactory(() => LocaleProvider(localRepo: sl()));

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Connectivity());
}
