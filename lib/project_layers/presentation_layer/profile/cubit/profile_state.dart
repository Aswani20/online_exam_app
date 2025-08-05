part of 'profile_view_model.dart';

abstract class ProfileState {}

class ProfileInitState extends ProfileState {}
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

// profile image
class ProfileImageLoaded extends ProfileState {
  final File image;
  ProfileImageLoaded(this.image);
}

