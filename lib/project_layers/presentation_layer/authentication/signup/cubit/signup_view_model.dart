import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/project_layers/domain_layer/use_cases/sign_up_use_case.dart';
import 'package:online_exam_app/project_layers/presentation_layer/authentication/signup/cubit/sign_up_states.dart';

@injectable
class SignupViewModel extends Cubit<SignUpStates> {
  SignUpUseCase signUpUseCase;

  SignupViewModel({required this.signUpUseCase}) : super(SignUpInitState());

  TextEditingController userNameController = TextEditingController(
    text: "Aswani20",
  );
  TextEditingController firstNameController = TextEditingController(
    text: "Abdelrahman",
  );
  TextEditingController lastNameController = TextEditingController(
    text: "youssef",
  );
  TextEditingController emailController = TextEditingController(
    text: "matrix511997@gmail.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: "01155704252@aA",
  );
  TextEditingController confirmPasswordController = TextEditingController(
    text: "01155704252@aA",
  );
  TextEditingController phoneNumberController = TextEditingController(
    text: "01155704252",
  );
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isEnable = false;
  bool isObscureText = true;
  bool isConfirmObscureText = true;

  void signUp() async {
    if (formKey.currentState!.validate()) {
      emit(SignUpLoadingState());
      var res = await signUpUseCase.invoke(
        username: userNameController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
        rePassword: confirmPasswordController.text,
        phone: phoneNumberController.text,
      );

      res.fold(
        (error) => emit(SignUpErrorState(errorMessage: error.errorMessage)),
        (signEntity) => emit(SignUpSuccessState(responseEntity: signEntity)),
      );
    }
  }

  void checkFormValidity() {
    if(userNameController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty){
      isEnable = true;
      emit(SignUpFormInteractionState(isButtonEnabled: isEnable));
    }else{
      isEnable = false;
      emit(SignUpFormInteractionState(isButtonEnabled: isEnable));
    }
  }

}
