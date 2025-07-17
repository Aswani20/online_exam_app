import 'package:injectable/injectable.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_request_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/repositories/signup_repo.dart';

@injectable
class SignUpUseCase{
  SignupRepo signupRepo;
  SignUpUseCase({required this.signupRepo});

  Future<SignUpResponseEntity> invoke(SignUpRequestEntity request) async{
    return await signupRepo.signup(request);
  }
}