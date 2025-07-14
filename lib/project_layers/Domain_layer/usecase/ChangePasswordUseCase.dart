import 'package:online_exam_app/project_layers/Domain_layer/repositories/ReretPasswordRepo.dart';
import 'package:online_exam_app/project_layers/api_layer/entities/ResetPasswordEntity.dart';

class ChangePasswordUseCase{
  final ResetPasswordRepo _repo;

  ChangePasswordUseCase(this._repo);

  Future<ResetPasswordEntity> change(String email, String password){
    return _repo.changePassword(email, password);
  }
}