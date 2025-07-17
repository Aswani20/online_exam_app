
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/project_layers/api_layer/entities/ForgotPasswordEntity.dart';

import 'package:online_exam_app/project_layers/api_layer/entities/ResetCodeEntity.dart';

import 'package:online_exam_app/project_layers/api_layer/entities/ResetPasswordEntity.dart';
import 'package:online_exam_app/project_layers/data_layer/dataSource/authRemoteDataSource.dart';

import '../../Domain_layer/repositories/authRepo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo{
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(this._authRemoteDataSource);

  @override
  Future<ResetPasswordEntity> changePassword(String email, String password) async {
    final model = await _authRemoteDataSource.changePassword(email, password);
    return ResetPasswordEntity(
      message: model.message,
      code: model.code
    );
  }

  @override
  Future<ResetCodeEntity> checkCode(String code) async {
    final model = await _authRemoteDataSource.checkCode(code);
    return ResetCodeEntity(
      message: model.message,
      code: model.code
    );
  }

  @override
  Future<ForgotPasswordEntity> sendEmail(String email) async {
    final model = await _authRemoteDataSource.sendEmail(email);
    return ForgotPasswordEntity(
        message: model.message,
        info: model.info
    );
  }
}