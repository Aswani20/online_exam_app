import 'package:injectable/injectable.dart';
import 'package:online_exam_app/project_layers/Domain_layer/repositories/ForgotPasswordRepo.dart';

import '../../api_layer/entities/ForgotPasswordEntity.dart';
import '../dataSource/ForgotPasswordRemoteDataSource.dart';

@injectable
class ForgotPasswordRepoImpl implements ForgotPasswordRepo{
  final ForgotPasswordRemoteDataSource _remoteDataSource;

  ForgotPasswordRepoImpl(this._remoteDataSource);

  @override
  Future<ForgotPasswordEntity> sendEmail(String email) async {
    final model = await _remoteDataSource.sendEmail(email);
    return ForgotPasswordEntity(
        message: model.message,
        info: model.info
    );
  }
}