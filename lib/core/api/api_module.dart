import 'dart:async';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:stock_management_exam/core/api/api_end_points.dart';
import 'package:stock_management_exam/core/api/interceptor/internet_connectivity_interceptor.dart';
import 'package:stock_management_exam/core/locator/locator.dart';
import 'package:stock_management_exam/data/remote/api_services.dart';

class ApiModule {
  static Future dioProvider() async {
    var dio = await setDio();

    locator.registerLazySingleton<Dio>(() => dio);
    locator.registerSingleton(ApiServices(dio));
  }

  static Future<Dio> setDio() async {
    Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: ApiEndPoints.baseUrl,
      connectTimeout: Duration(seconds: 120),
      receiveTimeout: Duration(seconds: 120),
      headers: {'Accept': 'application/json', 'Content-Type': 'application/json'},
    );

    dio.interceptors.add(
      PrettyDioLogger(error: true, responseBody: true, requestHeader: true, requestBody: true, responseHeader: true, request: true),
    );
    dio.interceptors.add(InternetConnectivityInterceptor());

    return dio;
  }
}
