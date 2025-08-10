part of 'profile_view_model.dart';

abstract class ProfileState {}

class ProfileInitState extends ProfileState {}

// Profile States
class ProfileLoadingState extends ProfileState {}
class ProfileErrorState extends ProfileState {
  String errMessage;
  ProfileErrorState({required this.errMessage});
}
class ProfileSuccessState extends ProfileState {
  ProfileResponseEntity responseEntity;
  ProfileSuccessState({required this.responseEntity});
}
class ProfileUpdatedState extends ProfileState {
  ProfileResponseEntity responseEntity;
  ProfileUpdatedState({required this.responseEntity});
}

// ChangePass States
class ChangePassLoadingState extends ProfileState {}
class ChangePassErrorState extends ProfileState {
  String errMessage;
  ChangePassErrorState({required this.errMessage});
}
class ChangePassSuccessState extends ProfileState {
  ChangePassResponseEntity responseEntity;
  ChangePassSuccessState({required this.responseEntity});
}

class ChangePassFormInteractionState extends ProfileState {
  final bool isButtonEnabled;
  ChangePassFormInteractionState({required this.isButtonEnabled});
}
