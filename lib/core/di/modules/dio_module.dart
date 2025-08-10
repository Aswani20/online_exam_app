import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/services/auth_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule{
  @singleton
  Dio provideDio(AuthInterceptor authInterceptor, PrettyDioLogger logger){
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://exam.elevateegy.com/api/',
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        validateStatus: (status) =>status !=null && status < 500
      )
    );
    dio.interceptors.addAll([
      authInterceptor,
      logger
    ]);
    return dio;
  }

  @singleton
  PrettyDioLogger providePrettyDioLogger(){
    return PrettyDioLogger(
      request: true,
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
    );
  }
}