import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/dialog/dialog.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/theme/app_validator.dart';
import 'package:online_exam_app/extensions/project_extensions.dart';
import 'package:online_exam_app/project_layers/presentation_layer/authentication/signin/cubit/sign_in_view_model.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  SignInViewModel signInViewModel = getIt<SignInViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInViewModel, SignInState>(
      bloc: signInViewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Icon(Icons.arrow_back_ios),
            ),
            leadingWidth: 20,
            title: Text(context.l10n.login, style: AppStyles.appBarTitleStyle),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  16.heightBox,
                  Form(
                    key: signInViewModel.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged:
                              (value) => signInViewModel.checkFormValidity(),
                          validator:
                              (value) =>
                                  AppValidators.nonEmptyField(value, context),
                          controller: signInViewModel.emailController,
                          decoration: InputDecoration(
                            labelText: context.l10n.email,
                            hintText: context.l10n.emailHint,
                          ),
                        ),
                        20.heightBox,
                        TextFormField(
                          onChanged:
                              (value) => signInViewModel.checkFormValidity(),
                          validator:
                              (value) => AppValidators.passwordValidator(
                                value,
                                context,
                              ),
                          controller: signInViewModel.passwordController,
                          obscureText: signInViewModel.isObscureText,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                signInViewModel.isObscureText =
                                    !signInViewModel.isObscureText;
                                setState(() {});
                              },
                              icon: Icon(
                                signInViewModel.isObscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                            labelText: context.l10n.password,
                            hintText: context.l10n.passwordHint,
                          ),
                        ),
                        25.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.forgetPasswordScreen,
                                );
                              },
                              child: Text(
                                "${context.l10n.forget_password}?",
                                style: AppStyles.mediumBlack16Style.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        30.heightBox,
                        SizedBox(
                          width: context.width,
                          child: ElevatedButton(
                            onPressed:
                                signInViewModel.isEnable
                                    ? () {
                                      signInViewModel.signIn();
                                    }
                                    : null,
                            child: Text(context.l10n.login),
                          ),
                        ),
                        16.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              context.l10n.notHaveAccount,
                              style: AppStyles.mediumBlack16Style,
                            ),
                            8.widthBox,
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.signUpScreen,
                                );
                              },
                              child: Text(
                                context.l10n.signUp,
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
        if (state is SignInLoadingState) {
          DialogUtils.showLoading(context: context, loadingMessage: "loading");
        } else if (state is SignInSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: state.responseEntity.message ?? "Success",
            posActions: "OK",
            posFunction: (p0) {
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.signUpScreen /*AppRoutes.loginScreen*/,
              );
            },
          );
        } else if (state is SignInErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: state.errMessage,
            negActions: "OK",
          );
        }
      },
    );
  }
}
