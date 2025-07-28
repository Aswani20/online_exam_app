import 'package:dartz/dartz.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/forget_pass_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/otp_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/reset_pass_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_in_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_response_entity.dart';



abstract class AuthRemoteDataSource {
  Future<Either<Failures, SignUpResponseEntity>> signup({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  });

  Future<Either<ForgetPassResponseEntity, Failures>> forgetPassword({
    required String email,
    String? networkError,
    String? serverError,
  });

  Future<Either<OtpResponseEntity, Failures>> otpVerify({
    required String code,
    String? networkError,
    String? serverError,
  });
  Future<Either<ResetPassResponseEntity, Failures>> resetPass({
    required String email,
    required String newPassword,
    String? networkError,
    String? serverError,
  });

  Future<Either<Failures, SignInResponseEntity>> signIn({
    required String email,
    required String password
  });
}
