part of 'signin_viewModel.dart';

abstract class SigninState {}

class SigninInitState extends SigninState {}

class SigninLoadingState extends SigninState {}

class SigninErrorState extends SigninState {
  String errMessage;
  SigninErrorState({required this.errMessage});
}

class SigninSuccessState extends SigninState {
  SignInResponseEntity responseEntity;
  SigninSuccessState({required this.responseEntity});
}

class SigninFormInteractionState extends SigninState {
  final bool isButtonEnabled;
  SigninFormInteractionState({required this.isButtonEnabled});
}
