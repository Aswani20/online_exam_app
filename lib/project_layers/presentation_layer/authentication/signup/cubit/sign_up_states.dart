import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_response_entity.dart';

abstract class SignUpStates{

}
class SignUpInitState extends SignUpStates{

}
class SignUpLoadingState extends SignUpStates{

}
class SignUpErrorState extends SignUpStates{
    String errorMessage;
    SignUpErrorState({required this.errorMessage});
}
class SignUpSuccessState extends SignUpStates{
  SignUpResponseEntity responseEntity;
  SignUpSuccessState({required this.responseEntity});
}