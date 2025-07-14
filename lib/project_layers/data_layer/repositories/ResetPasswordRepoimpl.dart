import 'package:injectable/injectable.dart';
import 'package:online_exam_app/project_layers/api_layer/entities/ResetPasswordEntity.dart';
import 'package:online_exam_app/project_layers/data_layer/dataSource/ResetPasswordRemoteDataSource.dart';

import '../../Domain_layer/repositories/ReretPasswordRepo.dart';

@injectable
class ResetPasswordRepoImpl implements ResetPasswordRepo{
  final ResetPasswordRemoteDataSource _resetPasswordRemoteDataSource;

  ResetPasswordRepoImpl(this._resetPasswordRemoteDataSource);

  Future<ResetPasswordEntity> changePassword(String email, String password) async {
    final model = await _resetPasswordRemoteDataSource.changePassword(email, password);
    return ResetPasswordEntity(
      message: model.message,
      code: model.code
    );
  }
}