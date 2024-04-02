import 'package:dio/dio.dart';
import 'package:flutter_final_graduation_project/cache/cache_helper.dart';
import 'package:flutter_final_graduation_project/network/api/End_point.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] =
        CacheHelper().getData(key: ApiKey.token) != null
            ? 'ECOMMERCEAPI ${CacheHelper().getData(key: ApiKey.token)}'
            : null;
    super.onRequest(options, handler);
  }
}
