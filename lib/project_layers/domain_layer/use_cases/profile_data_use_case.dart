import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/profile_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/repositories/profile_repo.dart';

@injectable
class ProfileDataUseCase{
  ProfileRepo _repo;
  ProfileDataUseCase(this._repo);

  Future<Either<Failures, ProfileResponseEntity>> invoke() async {
    return await _repo.getProfile();
  }

  Future<Either<Failures, ProfileResponseEntity>> editProfile({
    required String userName,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
  }) async {
    return await _repo.editProfile(
      userName: userName,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
    );
  }
}