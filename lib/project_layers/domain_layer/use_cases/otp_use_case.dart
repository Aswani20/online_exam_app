import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/repositories/auth_repo.dart';

import '../entities/forget_pass_response_entity.dart';
import '../entities/otp_response_entity.dart';

@injectable
class OtpUseCase {
  AuthRepo authRepo;

  OtpUseCase({required this.authRepo});

  Future<Either<OtpResponseEntity, Failures>> invoke({
    required String code,
    String? networkError,
    String? serverError,
  }) {
    return authRepo.otpVerify(
      code: code,
      networkError: networkError,
      serverError: serverError,
    );
  }
}
