import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:online_exam_app/project_layers/api_layer/model/requests/sign_up_request_dto.dart';
import 'package:online_exam_app/project_layers/data_layer/data_source/signup_remote_data_source.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_response_entity.dart';

@Injectable(as: SignupRemoteDataSource)
class SignupRemoteDataSourceImpl extends SignupRemoteDataSource {
  ApiClient _apiClient;

  SignupRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Either<Failures,SignUpResponseEntity>> signup (
      {required String username, required String firstName, required String lastName,
        required String email,
        required String password,
        required String rePassword,
        required String phone,
      }) async {


    try{
      var response = await _apiClient.signUp(request: SignUpRequestDto(username: username, firstName: firstName, lastName: lastName, email: email, password: password, rePassword: rePassword, phone: phone));
      var statusCode = response.response.statusCode;
      if(statusCode! >= 200 && statusCode < 300){
        return Right(response.data.toEntity());
      }
      else{
        return Left(ServerError(errorMessage: response.data.message ?? "Server Error"));
      }
    }
    on DioException catch (e) {
      return left(ServerError(errorMessage:e.response?.data.toString() ?? "Unknown Dio error" ));
    } catch (e) {
      return left(ServerError(errorMessage: "Unexpected error: $e"));
    }

  }
}
