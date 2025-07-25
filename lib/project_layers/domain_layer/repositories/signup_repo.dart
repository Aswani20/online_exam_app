import 'package:dartz/dartz.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_response_entity.dart';

import '../entities/forget_pass_response_entity.dart';
import '../entities/otp_response_entity.dart';
import '../entities/reset_pass_response_entity.dart';

abstract class SignupRepo {
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
}
