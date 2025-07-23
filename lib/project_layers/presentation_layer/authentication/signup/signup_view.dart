import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/dialog/dialog.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/theme/app_validator.dart';
import 'package:online_exam_app/extensions/project_extensions.dart';
import 'package:online_exam_app/project_layers/presentation_layer/authentication/signup/cubit/sign_up_states.dart';
import 'package:online_exam_app/project_layers/presentation_layer/authentication/signup/cubit/signup_view_model.dart';


class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  SignupViewModel viewModel = getIt<SignupViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupViewModel, SignUpStates>(
      bloc: viewModel,
      listener: (context,state){
        if(state is SignUpLoadingState){
          DialogUtils.showLoading(context: context, loadingMessage: "loading");
        }else if(state is SignUpSuccessState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content:
            state.responseEntity.message ??
               "Success",
            posActions:"OK",
            posFunction: (p0) {
              Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
            },
          );
        }
        else if(state is SignUpErrorState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: state.errorMessage,
            negActions: "Ok",
          );
        }

      },
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Icon(Icons.arrow_back_ios),
          ),
          leadingWidth: context.width * 0.06,
          title: Text(context.l10n.signUp, style: AppStyles.appBarTitleStyle),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                (context.height*0.02).heightBox,
                Form(
                  key: viewModel.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) => AppValidators.nonEmptyField(value, context),
                        controller: viewModel.userNameController,
                        decoration: InputDecoration(
                          labelText: context.l10n.userName,
                          hintText: context.l10n.userNameHint,
                        ),
                      ),
                      (context.height * 0.03).heightBox,
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              validator: (value) => AppValidators.nameValidator(value, context),
                              controller: viewModel.firstNameController,
                              decoration: InputDecoration(
                                labelText: context.l10n.firstName,
                                hintText: context.l10n.firstNameHint,
                              ),
                            ),
                          ),
                          (context.width * 0.02).widthBox,
                          Expanded(
                            child: TextFormField(
                              validator: (value) => AppValidators.nameValidator(value, context),
                              controller: viewModel.lastNameController,
                              decoration: InputDecoration(
                                labelText: context.l10n.lastName,
                                hintText: context.l10n.lastNameHint,
                              ),
                            ),
                          ),
                        ],
                      ),
                      (context.height * 0.03).heightBox,
                      TextFormField(
                        validator: (value) => AppValidators.emailValidator(value, context),
                        controller: viewModel.emailController,
                        decoration: InputDecoration(
                          labelText: context.l10n.email,
                          hintText: context.l10n.emailHint,
                        ),
                      ),
                      (context.height * 0.03).heightBox,
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              validator: (value) => AppValidators.passwordValidator(value, context),
                              controller: viewModel.passwordController,
                              decoration: InputDecoration(
                                labelText: context.l10n.password,
                                hintText: context.l10n.passwordHint,
                              ),
                            ),
                          ),
                          (context.width * 0.02).widthBox,
                          Expanded(
                            child: TextFormField(
                              validator: (value) => AppValidators.confirmPasswordValidator(value,viewModel.passwordController,context),
                              controller: viewModel.confirmPasswordController,
                              decoration: InputDecoration(
                                labelText: context.l10n.confirmPassword,
                                hintText: context.l10n.confirmPasswordHint,
                              ),
                            ),
                          ),
                        ],
                      ),
                      (context.height * 0.03).heightBox,
                      TextFormField(
                        validator: (value) => AppValidators.phoneNumberValidator(value, context),
                        controller: viewModel.phoneNumberController,
                        decoration: InputDecoration(
                          labelText: context.l10n.phoneNumber,
                          hintText: context.l10n.phoneNumberHint,
                        ),
                      ),
                      (context.height * 0.05).heightBox,
                      SizedBox(
                        width: context.width,
                        child: ElevatedButton(
                          onPressed: viewModel.signUp,
                          child: Text(context.l10n.signUp),
                        ),
                      ),
                      (context.height * 0.02).heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            context.l10n.haveAccount,
                            style: AppStyles.mediumBlack16Style,
                          ),
                          (context.width * 0.02).widthBox,
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.loginScreen);
                            },
                            child: Text(
                              context.l10n.login,
                              style: AppStyles.mediumBlack16Style.copyWith(
                                color: AppColors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
