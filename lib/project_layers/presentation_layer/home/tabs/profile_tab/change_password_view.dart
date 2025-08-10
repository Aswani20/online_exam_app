import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/extensions/project_extensions.dart';
import 'package:online_exam_app/project_layers/presentation_layer/home/tabs/profile_tab/cubit/profile_view_model.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/dialog/dialog.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/theme/app_validator.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  ProfileViewModel _viewModel = getIt<ProfileViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileViewModel, ProfileState>(
        bloc: _viewModel,
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                  onPressed: (){
                      Navigator.pop(context);
                  },
                ),
              ),
              leadingWidth: 30,
              title: Text(
                context.l10n.reset_password,
                style: AppStyles.appBarTitleStyle,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    16.heightBox,
                    Form(
                      key: _viewModel.changePassFormKey,
                      child: Column(
                        children: [
                          _passTextField(
                            controller: _viewModel.oldPasswordController,
                            label: context.l10n.oldPassword,
                            validator: (value) => AppValidators.nonEmptyField(value, context)
                          ),
                          20.heightBox,
                          _passTextField(
                            controller: _viewModel.newPasswordController,
                            label: context.l10n.newPassword,
                            validator: (value) => AppValidators.passwordValidator(value, context)
                          ),
                          20.heightBox,
                          _passTextField(
                            controller: _viewModel.rePasswordController,
                            label: context.l10n.confirmPassword,
                            validator: (value) => AppValidators.confirmPasswordValidator(value, _viewModel.rePasswordController, context)
                          ),
                          20.heightBox,
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed:
                              _viewModel.isEnable
                                  ? () {
                                _viewModel.changePassword();
                              } : null,
                              child: Text(context.l10n.update),
                            ),
                          )
                        ]
                      ),
                    )
                  ]
                ),
              ),
            ),
          );
        },
        listener: (context, state){
          if(state is ProfileLoadingState){
            DialogUtils.showLoading(context: context, loadingMessage: "loading");
          } else if(state is ProfileSuccessState){
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context: context,
                content: state.responseEntity.message ?? "Success",
                posActions: "OK",
                posFunction: (p0) {
                  Navigator.pop(context);
                }
            );
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.profileScreen
            );
          } else if(state is ProfileErrorState){
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context: context,
              content: state.errMessage,
              negActions: "OK",
            );
          }
        }
    );
  }

  Widget _passTextField({
    required TextEditingController controller,
    required String label,
    required FormFieldValidator<String>? validator
  }){
    return TextFormField(
      onChanged: (value) => _viewModel.checkFormValidity(),
      validator: validator,
      controller: controller,
      obscureText: _viewModel.isObscureText,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              _viewModel.isObscureText = !_viewModel.isObscureText;
              setState(() {});
            },
            icon: Icon(
              _viewModel.isObscureText
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
          ),
          labelText: label,
          hintText: label
      ),
    );
  }
}