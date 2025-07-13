
import 'package:online_exam_app/project_layers/Domain_layer/repositories/ForgotPasswordRepo.dart';

import '../../api_layer/entities/ForgotPasswordEntity.dart';

class SendForgotPasswordEmailUseCase{
  final ForgotPasswordRepo _repo;

  SendForgotPasswordEmailUseCase(this._repo);

  Future<ForgotPasswordEntity> call(String email){
    return _repo.sendEmail(email);
  }
}