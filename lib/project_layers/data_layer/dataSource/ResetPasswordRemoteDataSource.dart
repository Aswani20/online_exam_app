import 'package:online_exam_app/project_layers/Domain_layer/model/resetPassword.dart';

abstract class ResetPasswordRemoteDataSource{
  Future<ResetPassword> changePassword(String email, String password);
}