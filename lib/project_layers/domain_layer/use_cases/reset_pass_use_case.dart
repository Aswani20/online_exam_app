import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/repositories/signup_repo.dart';

import '../entities/forget_pass_response_entity.dart';
import '../entities/reset_pass_response_entity.dart';

@injectable
class ResetPassUseCase {
  SignupRepo signupRepo;

  ResetPassUseCase({required this.signupRepo});

  Future<Either<ResetPassResponseEntity, Failures>> invoke({
    required String email,
    required String newPassword,
    String? networkError,
    String? serverError,
  }) {
    return signupRepo.resetPass(
      email: email,
      newPassword: newPassword,
      networkError: networkError,
      serverError: serverError,
    );
  }
}
