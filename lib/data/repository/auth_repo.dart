// import 'package:dio/dio.dart';
// import 'package:kai_passenger_app/data/datasource/dio/dio_client.dart';
// import 'package:kai_passenger_app/data/datasource/exception/api_error_handler.dart';
// import 'package:kai_passenger_app/data/model/base/api_response.dart';
// import 'package:kai_passenger_app/data/model/body_post_model/change_password.dart';
// import 'package:kai_passenger_app/data/model/body_post_model/register_user.dart';
// import 'package:kai_passenger_app/data/model/body_post_model/reset_password.dart';
// import 'package:kai_passenger_app/data/model/user_moderl.dart';
// import 'package:kai_passenger_app/utils/Constants.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthRepo {
//   final DioClient? dioClient;
//   final SharedPreferences? sharedPreferences;

//   AuthRepo({
//     required this.dioClient,
//     required this.sharedPreferences,
//   });

//   Future<ApiResponse> getToken() async {
//     try {
//       Response response = await dioClient!.post(
//         Constants.getToken,
//         data: {
//           "email": Constants.appEmail,
//           "password": Constants.appPassword,
//         },
//       );
//       return ApiResponse.withSuccess(response);
//     } catch (e) {
//       DioError dioError = e as DioError;
//       return ApiResponse.withError(dioError.response!, ApiErrorHandler.getMessage(e));
//     }
//   }

//   Future<ApiResponse> verifyToken() async {
//     try {
//       Response response = await dioClient!.get(
//         Constants.verifyToken,
//       );
//       return ApiResponse.withSuccess(response);
//     } catch (e) {
//       DioError dioError = e as DioError;
//       return ApiResponse.withError(dioError.response!, ApiErrorHandler.getMessage(e));
//     }
//   }

//   String? retrieveToken() {
//     return sharedPreferences!.getString(Constants.token);
//   }

//   Future<void> saveToken(String token) async {
//     dioClient!.token = token;
//     dioClient!.dio!.options.headers = {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': token};
//     try {
//       await sharedPreferences!.setString(Constants.token, token);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<void> saveUser(String user) async {
//     try {
//       await sharedPreferences!.setString(Constants.user, user);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   String retrieveUser() {
//     return sharedPreferences!.getString(Constants.user) ?? "";
//   }

//   Future<ApiResponse> login(String email, String password) async {
//     try {
//       Response response = await dioClient!.post(
//         Constants.login,
//         data: {
//           "email": email,
//           "password": password,
//         },
//       );
//       return ApiResponse.withSuccess(response);
//     } catch (e) {
//       DioError dioError = e as DioError;
//       return ApiResponse.withError(dioError.response!, ApiErrorHandler.getMessage(e));
//     }
//   }

//   Future<ApiResponse> register(RegisterUserPost registerUserPost) async {
//     try {
//       Response response = await dioClient!.post(
//         Constants.register,
//         data: registerUserPost.toJson(),
//       );
//       return ApiResponse.withSuccess(response);
//     } catch (e) {
//       DioError dioError = e as DioError;
//       return ApiResponse.withError(dioError.response!, ApiErrorHandler.getMessage(e));
//     }
//   }

//   Future<ApiResponse> changePassword(ChangePasswordPost changePasswordPost) async {
//     try {
//       Response response = await dioClient!.post(
//         Constants.changePassword,
//         data: changePasswordPost.toJson(),
//       );
//       return ApiResponse.withSuccess(response);
//     } catch (e) {
//       DioError dioError = e as DioError;
//       return ApiResponse.withError(dioError.response!, ApiErrorHandler.getMessage(e));
//     }
//   }

//   Future<ApiResponse> forgotPassword(String email) async {
//     try {
//       Response response = await dioClient!.post(
//         Constants.forgotPassword,
//         data: {
//           "email" : email,
//         },
//       );
//       return ApiResponse.withSuccess(response);
//     } catch (e) {
//       DioError dioError = e as DioError;
//       return ApiResponse.withError(dioError.response!, ApiErrorHandler.getMessage(e));
//     }
//   }

//   Future<ApiResponse> verifyOTP(String email, String otp) async {
//     try {
//       Response response = await dioClient!.post(
//         Constants.verifyOTP,
//         data: {
//           "email": email,
//           "otp": otp,
//         },
//       );
//       return ApiResponse.withSuccess(response);
//     } catch (e) {
//       DioError dioError = e as DioError;
//       return ApiResponse.withError(dioError.response!, ApiErrorHandler.getMessage(e));
//     }
//   }

//   Future<ApiResponse> resetPassword(ResetPasswordPost resetPasswordPost) async {
//     try {
//       Response response = await dioClient!.post(
//         Constants.resetPassword,
//         data: resetPasswordPost.toJson(),
//       );
//       return ApiResponse.withSuccess(response);
//     } catch (e) {
//       DioError dioError = e as DioError;
//       return ApiResponse.withError(dioError.response!, ApiErrorHandler.getMessage(e));
//     }
//   }



//   Future<ApiResponse> updateProfile(UserModel userModel) async {
//     try {
//       Response response = await dioClient!.post(
//         Constants.updateProfile,
//         data: userModel.toJson(),
//       );
//       return ApiResponse.withSuccess(response);
//     } catch (e) {
//       DioError dioError = e as DioError;
//       return ApiResponse.withError(dioError.response!, ApiErrorHandler.getMessage(e));
//     }
//   }

//   bool isLoggedIn() {
//     bool isLoggedIn = sharedPreferences!.containsKey(Constants.token) && sharedPreferences!.containsKey(Constants.user);
//     return isLoggedIn;
//   }

//   Future<bool> clearSharedData() async {
//     sharedPreferences!.remove(Constants.user);
//     // sharedPreferences!.remove(Constants.token);
//     return true;
//   }
// }
