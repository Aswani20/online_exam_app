import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/profile_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/use_cases/change_pass_use_case.dart';
import 'package:online_exam_app/project_layers/domain_layer/use_cases/profile_data_use_case.dart';

import '../../../../../domain_layer/entities/change_pass_response_entity.dart';

part 'profile_state.dart';

final storage = FlutterSecureStorage();
@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  ProfileDataUseCase profileDataUseCase;
  ChangePassUseCase changePassUseCase;
  ProfileViewModel(this.profileDataUseCase , this.changePassUseCase) : super(ProfileInitState());

  bool isEnable = false;
  bool isObscureText = true;

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

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  GlobalKey<FormState> changePassFormKey = GlobalKey<FormState>();

  void changePassword() async {
    if (changePassFormKey.currentState!.validate()){
      emit(ChangePassLoadingState());
      var res = await changePassUseCase.invoke(
          oldPassword: oldPasswordController.text,
          newPassword: newPasswordController.text,
          rePassword: rePasswordController.text
      );

      res.fold(
          (err) => emit(ChangePassErrorState(errMessage: err.errorMessage)),
          (changeEntity) async {
            await storage.write(key: 'token', value: changeEntity.token);
            emit(ChangePassSuccessState(responseEntity: changeEntity));
          }
      );
    }
  }

  void checkFormValidity(){
    if(
        oldPasswordController.text.isNotEmpty &&
        newPasswordController.text.isNotEmpty &&
        rePasswordController.text.isNotEmpty
    ){
      isEnable = true;
      emit(ChangePassFormInteractionState(isButtonEnabled: isEnable));
    } else {
      isEnable = false;
      emit(ChangePassFormInteractionState(isButtonEnabled: isEnable));
    }
  }

}