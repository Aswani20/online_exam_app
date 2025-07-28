import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:online_exam_app/project_layers/api_layer/model/requests/forget_pass_request_dto.dart';
import 'package:online_exam_app/project_layers/api_layer/model/requests/otp_request_dto.dart';
import 'package:online_exam_app/project_layers/api_layer/model/requests/reset_pass_request_dto.dart';
import 'package:online_exam_app/project_layers/api_layer/model/requests/sign_in_request_dto.dart';
import 'package:online_exam_app/project_layers/api_layer/model/requests/sign_up_request_dto.dart';
import 'package:online_exam_app/project_layers/data_layer/data_source/auth_remote_data_source.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/forget_pass_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/otp_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_in_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_response_entity.dart';
import '../../domain_layer/entities/reset_pass_response_entity.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Either<Failures, SignUpResponseEntity>> signup({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    try {
      var response = await _apiClient.signUp(
        request: SignUpRequestDto(
          username: username,
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          rePassword: rePassword,
          phone: phone,
        ),
      );
      var statusCode = response.response.statusCode;
      if (statusCode! >= 200 && statusCode < 300) {
        return Right(response.data.toEntity());
      } else {
        return Left(
          ServerError(errorMessage: response.data.message ?? "Server Error"),
        );
      }
    } on DioException catch (e) {
      return left(
        ServerError(
          errorMessage: e.response?.data.toString() ?? "Unknown Dio error",
        ),
      );
    } catch (e) {
      return left(ServerError(errorMessage: "Unexpected error: $e"));
    }
  }

  @override
  Future<Either<ForgetPassResponseEntity, Failures>> forgetPassword({
    required String email,
    String? networkError,
    String? serverError,
  }) async {
    try {
      var response = await _apiClient.forgetPass(
        forgetPassRequest: ForgetPassRequestDto(email: email),
      );
      var statusCode = response.response.statusCode;
      var forgetPassResponse = response.data;

      if (statusCode! >= 200 && statusCode < 300) {
        return left(forgetPassResponse);
      } else {
        return right(
          ServerError(errorMessage: forgetPassResponse.message ?? serverError!),
        );
      }
    } on DioException catch (e) {
      return right(
        ServerError(
          errorMessage: e.response?.data.toString() ?? "Unknown Dio error",
        ),
      );
    } catch (e) {
      return right(ServerError(errorMessage: "Unexpected error: $e"));
    }
  }

  @override
  Future<Either<OtpResponseEntity, Failures>> otpVerify({
    required String code,
    String? networkError,
    String? serverError,
  }) async {
    try {
      var response = await _apiClient.otpVerify(
        otpRequest: OtpRequestDto(resetCode: code),
      );
      var statusCode = response.response.statusCode;
      var otpResponse = response.data;

      if (statusCode! >= 200 && statusCode < 300) {
        return left(otpResponse);
      } else {
        return right(
          ServerError(errorMessage: otpResponse.message ?? serverError!),
        );
      }
    } on DioException catch (e) {
      return right(
        ServerError(
          errorMessage: e.response?.data.toString() ?? "Unknown Dio error",
        ),
      );
    } catch (e) {
      return right(ServerError(errorMessage: "Unexpected error: $e"));
    }
  }

  @override
  Future<Either<ResetPassResponseEntity, Failures>> resetPass({
    required String email,
    required String newPassword,
    String? networkError,
    String? serverError,
  }) async {
    try {
      var response = await _apiClient.resetPass(
        resetPassRequest: ResetPassRequestDto(
          email: email,
          newPassword: newPassword,
        ),
      );
      var statusCode = response.response.statusCode;
      var resetResponse = response.data;

      if (statusCode! >= 200 && statusCode < 300) {
        return left(resetResponse);
      } else {
        return right(
          ServerError(errorMessage: resetResponse.message ?? serverError!),
        );
      }
    } on DioException catch (e) {
      return right(
        ServerError(
          errorMessage: e.response?.data.toString() ?? "Unknown Dio error",
        ),
      );
    } catch (e) {
      return right(ServerError(errorMessage: "Unexpected error: $e"));
    }
  }


  @override
  Future<Either<Failures, SignInResponseEntity>> signIn({
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
