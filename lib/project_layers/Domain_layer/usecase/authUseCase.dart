
import '../../api_layer/entities/ForgotPasswordEntity.dart';
import '../../api_layer/entities/ResetCodeEntity.dart';
import '../../api_layer/entities/ResetPasswordEntity.dart';
import '../repositories/authRepo.dart';

class AuthUseCase{
  final AuthRepo _repo;

  AuthUseCase(this._repo);

  Future<ForgotPasswordEntity> sendEmail(String email) async{
    return _repo.sendEmail(email);
  }

  Future<ResetCodeEntity> checkCode(String code) async{
    return _repo.checkCode(code);
  }

  Future<ResetPasswordEntity> changePassword(String email, String password) async{
    return _repo.changePassword(email, password);
  }
}