
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';

import '../entities/sign_in_response_entity.dart';
import '../repositories/signin_repo.dart';

@injectable
class SignInUseCase{
  SignInRepo signInRepo;
  SignInUseCase({
    required this.signInRepo
  });

  Future<Either<Failures, SignInResponseEntity>> invoke({
    required String email,
    required String password
  }) {
    return signInRepo.signIn(
        email: email,
        password: password
    );
  }
}