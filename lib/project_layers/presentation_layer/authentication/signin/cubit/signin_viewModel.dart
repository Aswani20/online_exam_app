import'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_in_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/use_cases/sign_in_use_case.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'signin_states.dart';

final storage = FlutterSecureStorage();
  @injectable
  class SigninViewModel extends Cubit<SigninState> {
    SignInUseCase signInUseCase;

    SigninViewModel({required this.signInUseCase}) : super(SigninInitState());

    TextEditingController emailController = TextEditingController(
      text: "yassentest5@gmail.com",
    );
    TextEditingController passwordController = TextEditingController(
      text: "Elevate@123",
    );
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    bool isEnable = false;
    bool isObscureText = true;

    void signIn() async {
      if(formKey.currentState!.validate()){
        emit(SigninLoadingState());
        var res = await signInUseCase.invoke(
            email: emailController.text,
            password: passwordController.text
        );

        res.fold(
            (err)=>emit(SigninErrorState(errMessage: err.errorMessage)),
            (signEntity) async{
              await storage.write(key: 'token', value: signEntity.token);
              emit(SigninSuccessState(responseEntity: signEntity));
            }
        );
      }
    }

    void checkFormValidity(){
      if(
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty){
        isEnable = true;
        emit(SigninFormInteractionState(isButtonEnabled: isEnable));
      } else {
        isEnable = false;
        emit(SigninFormInteractionState(isButtonEnabled: isEnable));
      }
    }
  }
