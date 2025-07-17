
import '../../Domain_layer/model/forgotPasswordModel.dart';
import '../../Domain_layer/model/resetCodeModel.dart';
import '../../Domain_layer/model/resetPasswordModel.dart';

abstract class AuthRemoteDataSource{
  Future<ForgotPasswordModel> sendEmail(String email);
  Future<ResetPasswordModel> changePassword(String email, String password);
  Future<ResetCodeModel> checkCode(String code);
}