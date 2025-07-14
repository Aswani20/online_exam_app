import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/project_layers/Domain_layer/model/resetPassword.dart';
import 'package:online_exam_app/project_layers/api_layer/api_client/api_client.dart';

import '../../data_layer/dataSource/ResetPasswordRemoteDataSource.dart';

@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImpl implements ResetPasswordRemoteDataSource{
  final ApiClient _client;

  ResetPasswordRemoteDataSourceImpl(this._client);

  @override
  Future<ResetPassword> changePassword(String email, String password) async {
    try{
      var responce = await _client.changePassword(
          {'email': email},
          {'newPassword': password});
      return responce.toResetPassword();
    } on DioException catch(e){
      // It's good practice to log the error or handle specific DioError types
      print("DioException in changePassword: ${e.message}");
      print("Response data: ${e.response?.data}");
      throw Exception("Failed to change email: ${e.message}");
    } catch(e) {
      print("Unknown error in changePassword: $e");
      throw Exception("An unknown error occurred: $e");
    }
  }

}