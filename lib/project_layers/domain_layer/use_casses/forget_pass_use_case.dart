import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/repositories/signup_repo.dart';

import '../entities/forget_pass_response_entity.dart';

@injectable
class ForgetPassUseCase {
  SignupRepo signupRepo;

  ForgetPassUseCase({required this.signupRepo});

  Future<Either<ForgetPassResponseEntity, Failures>> invoke({
    required String email,
    String? networkError,
    String? serverError,
  }) {
    return signupRepo.forgetPassword(
      email: email,
      networkError: networkError,
      serverError: serverError,
    );
  }
}
