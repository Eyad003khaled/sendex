import 'package:dio/dio.dart';


class ApiInterceptor extends Interceptor {


  ApiInterceptor();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Retrieve the token using the instance of CacheHelper

    super.onRequest(options, handler);
  }
}
