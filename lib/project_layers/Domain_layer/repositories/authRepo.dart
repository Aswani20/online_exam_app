import 'package:online_exam_app/project_layers/api_layer/entities/ResetCodeEntity.dart';
import '../../api_layer/entities/ForgotPasswordEntity.dart';
import '../../api_layer/entities/ResetPasswordEntity.dart';

abstract class AuthRepo{
  Future<ForgotPasswordEntity> sendEmail(String email);

  Future<ResetCodeEntity> checkCode(String code);

  Future<ResetPasswordEntity> changePassword(String email, String password);

}