import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/profile_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/use_cases/profile_data_use_case.dart';

part 'profile_state.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  ProfileDataUseCase profileDataUseCase;
  ProfileViewModel(this.profileDataUseCase) : super(ProfileInitState());

  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> getProfile() async {
    emit(ProfileLoadingState());
    var res = await profileDataUseCase.invoke();

    res.fold(
      (error) => emit(ProfileErrorState(errMessage: error.errorMessage)),
      (profileEntity) => emit(ProfileSuccessState(responseEntity: profileEntity)),
    );
  }

  Future<void> updateProfile() async {
    if (!formKey.currentState!.validate()) return;

    emit(ProfileLoadingState());

    var res = await profileDataUseCase.editProfile(
      userName: userNameController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      phoneNumber: phoneNumberController.text,
    );

    res.fold(
      (error) => emit(ProfileErrorState(errMessage: error.errorMessage)),
      (profileEntity) => emit(ProfileUpdatedState(responseEntity: profileEntity))
    );
  }
}
