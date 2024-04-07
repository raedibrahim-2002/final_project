import 'package:dio/dio.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/shared_prefrences.dart';

class AppDio {
  static Dio? _dio;
  static Dio _instance() {
    return _dio ??= Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
      ),
    );
  }

  static void init() {
    _dio = _instance();
  }

  static Future<Response<dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio!.get(
      endPoint,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          'lang': 'ar',
          'Content-Type': 'application/json',
          'Authorization': PreferenceUtils.getString(PrefKeys.apiToken),
        },
      ),
    );
  }

  static Future<Response<dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) {
    return _dio!.post(
      endPoint,
      queryParameters: queryParameters,
      data: body,
      options: Options(
        headers: {
          'lang': 'ar',
          'Content-Type': 'application/json',
          'Authorization': PreferenceUtils.getString(PrefKeys.apiToken),
        },
      ),
    );
  }

  static Future<Response<dynamic>> put({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) {
    return _dio!.put(
      endPoint,
      queryParameters: queryParameters,
      data: body,
      options: Options(
        headers: {
          'lang': 'ar',
          'Content-Type': 'application/json',
          'Authorization': PreferenceUtils.getString(PrefKeys.apiToken),
        },
      ),
    );
  }

  static Future<Response<dynamic>> delete({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) {
    return _dio!.delete(
      endPoint,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          'lang': 'ar',
          'Content-Type': 'application/json',
          'Authorization': PreferenceUtils.getString(PrefKeys.apiToken),
        },
      ),
    );
  }
}


//----------------------------------------------------------------------------
// abstract class ApiConsumer {
//   Future<dynamic> get(
//     String path, {
//     Object? data,
//     Map<String, dynamic>? queryParameters,
//   });
//   Future<dynamic> post(String path,
//       {Object? data,
//       Map<String, dynamic>? queryParameters,
//       bool isFormData = false});
//   Future<dynamic> patch(String path,
//       {Object? data,
//       Map<String, dynamic>? queryParameters,
//       bool isFormData = false});
//   Future<dynamic> delete(String path,
//       {Object? data,
//       Map<String, dynamic>? queryParameters,
//       bool isFormData = false});
// }
