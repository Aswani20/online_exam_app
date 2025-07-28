import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/domain_layer/repositories/auth_repo.dart';
import '../entities/sign_in_response_entity.dart';

@injectable
class SignInUseCase{
  AuthRepo authRepo;
  SignInUseCase({
    required this.authRepo
  });

  Future<Either<Failures, SignInResponseEntity>> invoke({
    required String email,
    required String password
  }) {
    return authRepo.signIn(
        email: email,
        password: password
    );
  }
}