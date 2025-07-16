
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/project_layers/Domain_layer/model/forgotPasswordModel.dart';
import 'package:online_exam_app/project_layers/Domain_layer/model/resetCodeModel.dart';
import 'package:online_exam_app/project_layers/Domain_layer/model/resetPasswordModel.dart';
import 'package:online_exam_app/project_layers/data_layer/dataSource/authRemoteDataSource.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../api_client/api_client.dart';

final getIt = GetIt.instance;

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  final ApiClient _client;
  final Dio _dio;
  final PrettyDioLogger _logger;

  AuthRemoteDataSourceImpl(this._client):
      _dio = getIt<Dio>(),
      _logger = getIt<PrettyDioLogger>();

  @override
  Future<ResetPasswordModel> changePassword(String email, String password) async {
    try{
      var response = await _client.changePassword({'email': email}, {'password': password});
      return response.toResetPassword();
    } catch (e, stackTrace) {
      _logger.logPrint('Error in sendEmail: $e\nStackTrace: $stackTrace');
      throw Exception('Failed to send reset password');
    }
  }

  @override
  Future<ResetCodeModel> checkCode(String code) async {
    try{
      var response = await _client.postCode({'code': code});
      return response.toResetCode();
    } catch (e, stackTrace) {
      _logger.logPrint('Error in sendEmail: $e\nStackTrace: $stackTrace');
      throw Exception('Failed to send reset code');
    }
  }

  @override
  Future<ForgotPasswordModel> sendEmail(String email) async {
    try {
      var response = await _client.postEmail({'email': email});
      return response.toForgotPassword();
    } catch (e, stackTrace) {
      _logger.logPrint('Error in sendEmail: $e\nStackTrace: $stackTrace');
      throw Exception('Failed to send forgot password email');
    }
  }

}