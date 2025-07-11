import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule{
  @lazySingleton
  Dio provideDio(){
    Dio dio = Dio();
    dio.options.headers = {
      "content-type": "application/json"
    };
    dio.options.baseUrl = "https://exam.elevateegy.com";
    dio.interceptors.add(getIt<PrettyDioLogger>());
    return dio;
  }

  @lazySingleton
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