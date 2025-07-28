import 'package:dartz/dartz.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import '../entities/sign_in_response_entity.dart';

abstract class SignInRepo{
  Future<Either<Failures, SignInResponseEntity>> signIn({
    required String email,
    required String password
  });
}