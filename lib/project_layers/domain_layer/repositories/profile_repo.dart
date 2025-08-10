import 'package:dartz/dartz.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/change_pass_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/profile_response_entity.dart';

abstract class ProfileRepo{
  Future<Either<Failures, ProfileResponseEntity>> getProfile();

  Future<Either<Failures, ProfileResponseEntity>> editProfile({
    required String userName,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
  });

  Future<Either<Failures, ChangePassResponseEntity>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String rePassword,
  });
}