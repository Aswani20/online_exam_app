import 'package:online_exam_app/project_layers/api_layer/entities/ResetPasswordEntity.dart';

abstract class ResetPasswordRepo{
  Future<ResetPasswordEntity> changePassword(String email, String password);
}