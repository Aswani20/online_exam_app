import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:online_exam_app/project_layers/api_layer/model/requests/sign_in_request_dto.dart';
import 'package:online_exam_app/project_layers/data_layer/data_source/signin_remote_data_source.dart';

import '../../domain_layer/entities/sign_in_response_entity.dart';

@Injectable(as: SigninRemoteDataSource)
class SigninRemoteDataSourceImpl extends SigninRemoteDataSource{
  ApiClient _apiClient;
  SigninRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Either<Failures, SignInResponseEntity>> signin({
    required String email,
    required String password
  }) async {
    try{
      var response = await _apiClient.signin(
          request: SigninRequestDto(
            email: email,
            password: password,
          )
      );
      var statusCode = response.response.statusCode;
      final token = response.data.token;
      if (statusCode! >= 200 && statusCode < 300) {
        return Right(response.data.toEntity());
      } else {
        return Left(
          ServerError(errorMessage: response.data.message ?? "Server Error")
        );
      }
    } on DioException catch(e){
      return left(
        ServerError(
          errorMessage: e.response?.data.toString() ?? "Unknown Dio error"
        )
      );
    } catch(e){
      return left(ServerError(errorMessage: "Unexpected error: $e"));
    }
  }

}