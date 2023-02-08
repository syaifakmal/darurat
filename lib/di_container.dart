// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// final sl = GetIt.instance;
//
// Future<void> init() async {
//   // Core
//   // sl.registerLazySingleton(() => NetworkInfo(sl()));
//   sl.registerLazySingleton(() => DioClient(Constants.baseURL, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));
//
//   // Repository
//   sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
//   sl.registerLazySingleton(() => PromoRepo(dioClient: sl()));
//   sl.registerLazySingleton(() => OrderRepo(dioClient: sl()));
//
//   // Provider
//   sl.registerFactory(() => AuthProvider(authRepo: sl()));
//   sl.registerFactory(() => PromoProvider(promoRepo: sl()));
//   sl.registerFactory(() => OrderProvider(orderRepo: sl()));
//   sl.registerFactory(() => LocationProvider());
//
//   // External
//   final sharedPreferences = await SharedPreferences.getInstance();
//   sl.registerLazySingleton(() => sharedPreferences);
//   sl.registerLazySingleton(() => Dio());
//   sl.registerLazySingleton(() => LoggingInterceptor());
//   // sl.registerLazySingleton(() => Connectivity());
// }
