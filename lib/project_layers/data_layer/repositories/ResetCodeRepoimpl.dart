import 'package:injectable/injectable.dart';
import 'package:online_exam_app/project_layers/api_layer/entities/ResetCodeEntity.dart';
import 'package:online_exam_app/project_layers/data_layer/dataSource/ResetCodeRemoteDataSource.dart';

import '../../Domain_layer/repositories/ResetCodeRepo.dart';

@injectable
class ResetCodeRepoImpl implements ResetCodeRepo{
  final ResetCodeRemoteDataSource _resetPasswordRemoteDataSource;

  ResetCodeRepoImpl(this._resetPasswordRemoteDataSource);

  @override
  Future<ResetCodeEntity> SendCode(String code) async {
    final model = await _resetPasswordRemoteDataSource.SendCode(code);
    return ResetCodeEntity(
      message: model.message,
      code: model.code
    );
  }
}