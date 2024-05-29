// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables



import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CustomDio {
  var _dio;
  Dio get instance => _dio;
  CustomDio() {
    _dio = Dio();

    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,

        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,

        // canShowLog: kDebugMode,
      ),
    );
  }
}
