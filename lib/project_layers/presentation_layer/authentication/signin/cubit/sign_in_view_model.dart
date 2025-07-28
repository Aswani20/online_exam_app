import'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/project_layers/domain_layer/use_cases/sign_in_use_case.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../domain_layer/entities/sign_in_response_entity.dart';
part 'signin_states.dart';

final storage = FlutterSecureStorage();
  @injectable
  class SignInViewModel extends Cubit<SignInState> {
    SignInUseCase signInUseCase;

    SignInViewModel({required this.signInUseCase}) : super(SignInInitState());

    TextEditingController emailController = TextEditingController(
      text: "yassentest5@gmail.com ",
    );
    TextEditingController passwordController = TextEditingController(
      text: "Elevate@123",
    );
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    bool isEnable = false;
    bool isObscureText = true;

    void signIn() async {
      if(formKey.currentState!.validate()){
        emit(SignInLoadingState());
        var res = await signInUseCase.invoke(
            email: emailController.text,
            password: passwordController.text
        );

        res.fold(
            (err)=>emit(SignInErrorState(errMessage: err.errorMessage)),
            (signEntity) async{
              await storage.write(key: 'token', value: signEntity.token);
              emit(SignInSuccessState(responseEntity: signEntity));
            }
        );
      }
    }

    void checkFormValidity(){
      if(
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty){
        isEnable = true;
        emit(SignInFormInteractionState(isButtonEnabled: isEnable));
      } else {
        isEnable = false;
        emit(SignInFormInteractionState(isButtonEnabled: isEnable));
      }
    }
  }
