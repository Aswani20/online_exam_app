import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/profile_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/use_cases/profile_data_use_case.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_state.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  ProfileDataUseCase profileDataUseCase;
  ProfileViewModel(this.profileDataUseCase) : super(ProfileInitState());

  final ImagePicker _picker = ImagePicker();

  Future<void> loadSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString('profile_image_path');
    if (path != null && File(path).existsSync()) {
      emit(ProfileImageLoaded(File(path)));
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 75);

    if (pickedFile != null) {
      final savedFile = await _saveImageLocally(File(pickedFile.path));
      emit(ProfileImageLoaded(savedFile));
    }
  }

  Future<File> _saveImageLocally(File image) async {
    final dir = await getApplicationDocumentsDirectory();
    final savedImage = await image.copy('${dir.path}/profile_image.png');

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image_path', savedImage.path);

    return savedImage;
  }

  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> getProfile() async {
    emit(ProfileLoadingState());
    var res = await profileDataUseCase.invoke();
    await loadSavedImage();

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
