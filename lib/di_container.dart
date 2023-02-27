import 'package:darurat/data/repository/language_repo.dart';
import 'package:darurat/data/repository/theme_repo.dart';
import 'package:darurat/provider/data_provider.dart';
import 'package:darurat/provider/theme_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'provider/locale_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  // sl.registerLazySingleton(() => NetworkInfo(sl()));
  // sl.registerLazySingleton(() => DioClient(Constants.baseURL, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));
  //
  // // Repository
  sl.registerLazySingleton(() => ThemeRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => LocaleRepo(sharedPreferences: sl()));
  // sl.registerLazySingleton(() => PromoRepo(dioClient: sl()));
  // sl.registerLazySingleton(() => OrderRepo(dioClient: sl()));

  // Provider
  sl.registerFactory(() => ThemeProvider(themeRepo: sl()));
  sl.registerFactory(() => DataProvider());
  sl.registerFactory(() => LocaleProvider(localRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => Dio());
  // sl.registerLazySingleton(() => LoggingInterceptor());
  // sl.registerLazySingleton(() => Connectivity());
}
