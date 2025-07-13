
import '../../Domain_layer/model/Forgot.dart';

abstract class ForgotPasswordRemoteDataSource{
  Future<Forgot> sendEmail(String email);
}