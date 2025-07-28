import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/data_layer/data_source/auth_remote_data_source.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/forget_pass_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/otp_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_in_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/repositories/auth_repo.dart';

import '../../domain_layer/entities/reset_pass_response_entity.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;
  AuthRepoImpl(this._remoteDataSource);

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
    var response = await _remoteDataSource.signup(
      username: username,
      email: email,
      firstName: firstName,
      lastName: lastName,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
    return response.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<ForgetPassResponseEntity, Failures>> forgetPassword({
    required String email,
    String? networkError,
    String? serverError,
  }) async {
    var either = await _remoteDataSource.forgetPassword(
      email: email,
      networkError: networkError,
      serverError: serverError,
    );

    return either.fold(
      (response) {
        return Left(response);
      },
      (error) {
        return Right(error);
      },
    );
  }

  @override
  Future<Either<OtpResponseEntity, Failures>> otpVerify({
    required String code,
    String? networkError,
    String? serverError,
  }) async {
    var either = await _remoteDataSource.otpVerify(
      code: code,
      networkError: networkError,
      serverError: serverError,
    );

    return either.fold(
      (response) {
        return Left(response);
      },
      (error) {
        return Right(error);
      },
    );
  }

  @override
  Future<Either<ResetPassResponseEntity, Failures>> resetPass({
    required String email,
    required String newPassword,
    String? networkError,
    String? serverError,
  }) async {
    var either = await _remoteDataSource.resetPass(
      email: email,
      newPassword: newPassword,
      networkError: networkError,
      serverError: serverError,
    );

    return either.fold(
      (response) {
        return Left(response);
      },
      (error) {
        return Right(error);
      },
    );
  }

  @override
  Future<Either<Failures, SignInResponseEntity>> signIn({
    required String email,
    required String password,
  }) async {
    var response = await _remoteDataSource.signIn(
      email: email,
      password: password,
    );

    return response.fold((error) => Left(error), (response) => Right(response));
  }
}
