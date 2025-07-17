import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_request_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/use_casses/sign_up_use_case.dart';
import 'package:online_exam_app/project_layers/presentation_layer/authentication/signup/cubit/sign_up_states.dart';


@injectable
class SignupViewModel extends Cubit<SignUpStates> {
  SignUpUseCase signUpUseCase;
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SignupViewModel({required this.signUpUseCase}) : super(SignUpInitState());

  void signUp() async{
    if(formKey.currentState!.validate()){
      emit(SignUpLoadingState());
      var res =await signUpUseCase.invoke(
        SignUpRequestEntity(
          username: userNameController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          password: passwordController.text,
          rePassword: confirmPasswordController.text,
          phone: phoneNumberController.text,
        ),
      );
      if(res.code! >= 200 && res.code! < 300) emit(SignUpSuccessState(responseEntity: res));
      emit(SignUpErrorState(errorMessage: res.message.toString()));
    }
  }
}
