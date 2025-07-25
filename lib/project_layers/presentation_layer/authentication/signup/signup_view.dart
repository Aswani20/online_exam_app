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
    return BlocConsumer<SignupViewModel, SignUpStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Icon(Icons.arrow_back_ios),
            ),
            leadingWidth: 20,
            title: Text(context.l10n.signUp, style: AppStyles.appBarTitleStyle),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  16.heightBox,
                  Form(
                    key: viewModel.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value) => viewModel.checkFormValidity(),
                          validator: (value) =>
                              AppValidators.nonEmptyField(value, context),
                          controller: viewModel.userNameController,
                          decoration: InputDecoration(
                            labelText: context.l10n.userName,
                            hintText: context.l10n.userNameHint,
                          ),
                        ),
                        20.heightBox,
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                onChanged: (value) =>
                                    viewModel.checkFormValidity(),
                                validator: (value) =>
                                    AppValidators.nameValidator(value, context),
                                controller: viewModel.firstNameController,
                                decoration: InputDecoration(
                                  labelText: context.l10n.firstName,
                                  hintText: context.l10n.firstNameHint,
                                ),
                              ),
                            ),
                            12.widthBox,
                            Expanded(
                              child: TextFormField(
                                onChanged: (value) =>
                                    viewModel.checkFormValidity(),
                                validator: (value) =>
                                    AppValidators.nameValidator(value, context),
                                controller: viewModel.lastNameController,
                                decoration: InputDecoration(
                                  labelText: context.l10n.lastName,
                                  hintText: context.l10n.lastNameHint,
                                ),
                              ),
                            ),
                          ],
                        ),
                        20.heightBox,
                        TextFormField(
                          onChanged: (value) => viewModel.checkFormValidity(),
                          validator: (value) =>
                              AppValidators.emailValidator(value, context),
                          controller: viewModel.emailController,
                          decoration: InputDecoration(
                            labelText: context.l10n.email,
                            hintText: context.l10n.emailHint,
                          ),
                        ),
                        20.heightBox,
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                onChanged: (value) =>
                                    viewModel.checkFormValidity(),
                                validator: (value) =>
                                    AppValidators.passwordValidator(
                                      value,
                                      context,
                                    ),
                                controller: viewModel.passwordController,
                                obscureText: viewModel.isObscureText,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      viewModel.isObscureText =
                                          !viewModel.isObscureText;
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      viewModel.isObscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  labelText: context.l10n.password,
                                  hintText: context.l10n.passwordHint,
                                ),
                              ),
                            ),
                            12.widthBox,
                            Expanded(
                              child: TextFormField(
                                onChanged: (value) =>
                                    viewModel.checkFormValidity(),
                                validator: (value) =>
                                    AppValidators.confirmPasswordValidator(
                                      value,
                                      viewModel.passwordController,
                                      context,
                                    ),
                                controller: viewModel.confirmPasswordController,
                                obscureText: viewModel.isConfirmObscureText,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      viewModel.isConfirmObscureText =
                                          !viewModel.isConfirmObscureText;
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      viewModel.isConfirmObscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  labelText: context.l10n.confirmPassword,
                                  hintText: context.l10n.confirmPasswordHint,
                                ),
                              ),
                            ),
                          ],
                        ),
                        20.heightBox,
                        TextFormField(
                          onChanged: (value) => viewModel.checkFormValidity(),
                          validator: (value) =>
                              AppValidators.phoneNumberValidator(
                                value,
                                context,
                              ),
                          controller: viewModel.phoneNumberController,
                          decoration: InputDecoration(
                            labelText: context.l10n.phoneNumber,
                            hintText: context.l10n.phoneNumberHint,
                          ),
                        ),
                        25.heightBox,
                        SizedBox(
                          width: context.width,
                          child: ElevatedButton(
                            onPressed: viewModel.isEnable
                                ? () {
                                    viewModel.signUp();
                                  }
                                : null,
                            child: Text(context.l10n.signUp),
                          ),
                        ),
                        16.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              context.l10n.haveAccount,
                              style: AppStyles.mediumBlack16Style,
                            ),
                            8.widthBox,
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.forgetPasswordScreen,
                                );
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
        );
      },
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          DialogUtils.showLoading(context: context, loadingMessage: "loading");
        } else if (state is SignUpSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: state.responseEntity.message ?? "Success",
            posActions: "OK",
            posFunction: (p0) {
              Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
            },
          );
        } else if (state is SignUpErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: state.errorMessage,
            negActions: "Ok",
          );
        }
      },
    );
  }
}
