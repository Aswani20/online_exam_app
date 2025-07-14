import 'package:online_exam_app/project_layers/Domain_layer/repositories/ResetCodeRepo.dart';
import 'package:online_exam_app/project_layers/api_layer/entities/ResetCodeEntity.dart';

class SendResetPasswordCodeUseCase{
  final ResetCodeRepo _repo;

  SendResetPasswordCodeUseCase(this._repo);

  Future<ResetCodeEntity> send(String code){
    return _repo.SendCode(code);
  }
}