import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/data_layer/data_source/profile_remote_data_source.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/profile_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/repositories/profile_repo.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo{
  final ProfileRemoteDataSource _remoteDataSource;
  ProfileRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failures, ProfileResponseEntity>> getProfile() async {
    var response = await _remoteDataSource.getProfile();
    return response.fold(
        (err) => Left(err),
        (res) => Right(res)
    );
  }

  @override
  Future<Either<Failures, ProfileResponseEntity>> editProfile({
    required String userName,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
  }) async {
    var response = await _remoteDataSource.editProfile(
      userName: userName,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
    );
    return response.fold(
        (err) => Left(err),
        (res) => Right(res)
    );
  }
}