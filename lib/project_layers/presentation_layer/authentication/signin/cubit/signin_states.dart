part of 'sign_in_view_model.dart';

abstract class SignInState {}

class SignInInitState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInErrorState extends SignInState {
  String errMessage;
  SignInErrorState({required this.errMessage});
}

class SignInSuccessState extends SignInState {
  SignInResponseEntity responseEntity;
  SignInSuccessState({required this.responseEntity});
}

class SignInFormInteractionState extends SignInState {
  final bool isButtonEnabled;
  SignInFormInteractionState({required this.isButtonEnabled});
}
