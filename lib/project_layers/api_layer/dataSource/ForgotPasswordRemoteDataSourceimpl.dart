import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:online_exam_app/project_layers/data_layer/dataSource/ForgotPasswordRemoteDataSource.dart';

import '../../Domain_layer/model/Forgot.dart';

@Injectable(as: ForgotPasswordRemoteDataSource)
class ForgotPasswordRemoteDataSourceImpl implements ForgotPasswordRemoteDataSource{
  final ApiClient _client;

  ForgotPasswordRemoteDataSourceImpl(this._client);

  @override
  Future<Forgot> sendEmail(String email) async {
    try {
      var response = await _client.postEmail({'email': email});
      return response.toForgot();
    } on DioException catch (e) {
      // It's good practice to log the error or handle specific DioError types
      print("DioException in sendEmail: ${e.message}");
      print("Response data: ${e.response?.data}");
      throw Exception("Failed to send email: ${e.message}");
    } catch(e) {
      print("Unknown error in sendEmail: $e");
      throw Exception("An unknown error occurred: $e");
    }
  }
}