
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
class ApiModule{

  @singleton
  Dio provideDio(PrettyDioLogger logger){
    var dio = Dio(
      BaseOptions(
        baseUrl: "https://exam.elevateegy.com/api/",
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      )
    );
    dio.interceptors.add(logger);
    return dio;
  }

  @lazySingleton // Or @singleton if you prefer, lazySingleton defers creation until first needed
  PrettyDioLogger providePrettyDioLogger() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode, // Only enable in debug mode
    );
  }
}