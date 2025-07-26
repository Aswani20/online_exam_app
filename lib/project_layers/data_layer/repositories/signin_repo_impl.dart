
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/Domain_layer/entities/sign_in_response_entity.dart';
import 'package:online_exam_app/project_layers/Domain_layer/repositories/signin_repo.dart';
import 'package:online_exam_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:online_exam_app/project_layers/data_layer/data_source/signin_remote_data_source.dart';

@Injectable(as: SignInRepo)
class SigninRepoImpl implements SignInRepo{
  final ApiClient apiClient;
  final FlutterSecureStorage storage;
  final SigninRemoteDataSource _RemoteDataSource;
  SigninRepoImpl(
      this._RemoteDataSource,
      this.apiClient,
      this.storage
      );

  @override
  Future<Either<Failures, SignInResponseEntity>> signin({
    required String email,
    required String password
  }) async {
    var response = await _RemoteDataSource.signin(
        email: email,
        password: password
    );

    return response.fold(
            (error) => Left(error),
            (response) => Right(response)
    );
  }

}