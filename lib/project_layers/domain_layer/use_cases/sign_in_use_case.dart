
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/Domain_layer/entities/sign_in_response_entity.dart';
import 'package:online_exam_app/project_layers/Domain_layer/repositories/signin_repo.dart';

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
    return signInRepo.signin(
        email: email,
        password: password
    );
  }
}