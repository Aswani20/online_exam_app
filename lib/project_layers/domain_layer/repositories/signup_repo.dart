import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_request_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_response_entity.dart';

abstract class SignupRepo{
  Future<SignUpResponseEntity> signup(SignUpRequestEntity request);
}