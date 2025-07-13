
import '../../api_layer/entities/ForgotPasswordEntity.dart';

abstract class ForgotPasswordRepo{
  Future<ForgotPasswordEntity> sendEmail(String email);
}