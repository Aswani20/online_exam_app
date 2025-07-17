import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/core/theme/app_constants.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/theme/app_validator.dart';
import 'package:online_exam_app/extensions/project_extensions.dart';
import 'package:online_exam_app/project_layers/presentation_layer/authentication/signup/cubit/sign_up_states.dart';
import 'package:online_exam_app/project_layers/presentation_layer/authentication/signup/cubit/signup_view_model.dart';
import '../../../../core/theme/app_colors.dart';

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
          Fluttertoast.showToast(
              msg: "Loading...",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }else if(state is SignUpSuccessState){
          Fluttertoast.showToast(
              msg: state.responseEntity.message.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }else if(state is SignUpErrorState){
          Fluttertoast.showToast(
              msg: state.errorMessage.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
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
          title: Text(AppConstants.signUp, style: AppStyles.appBarTitleStyle),
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
                        validator: AppValidators.nonEmptyField,
                        controller: viewModel.userNameController,
                        decoration: InputDecoration(
                          labelText: AppConstants.userName,
                          hintText: AppConstants.userNameHint,
                        ),
                      ),
                      (context.height * 0.03).heightBox,
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              validator: AppValidators.nameValidator,
                              controller: viewModel.firstNameController,
                              decoration: InputDecoration(
                                labelText: AppConstants.firstName,
                                hintText: AppConstants.firstNameHint,
                              ),
                            ),
                          ),
                          (context.width * 0.02).widthBox,
                          Expanded(
                            child: TextFormField(
                              validator: AppValidators.nameValidator,
                              controller: viewModel.lastNameController,
                              decoration: InputDecoration(
                                labelText: AppConstants.lastName,
                                hintText: AppConstants.lastNameHint,
                              ),
                            ),
                          ),
                        ],
                      ),
                      (context.height * 0.03).heightBox,
                      TextFormField(
                        validator: AppValidators.emailValidator,
                        controller: viewModel.emailController,
                        decoration: InputDecoration(
                          labelText: AppConstants.email,
                          hintText: AppConstants.emailHint,
                        ),
                      ),
                      (context.height * 0.03).heightBox,
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              validator: AppValidators.passwordValidator,
                              controller: viewModel.passwordController,
                              decoration: InputDecoration(
                                labelText: AppConstants.password,
                                hintText: AppConstants.passwordHint,
                              ),
                            ),
                          ),
                          (context.width * 0.02).widthBox,
                          Expanded(
                            child: TextFormField(
                              validator: (value) => AppValidators.confirmPasswordValidator(value,viewModel.passwordController),
                              controller: viewModel.confirmPasswordController,
                              decoration: InputDecoration(
                                labelText: AppConstants.confirmPassword,
                                hintText: AppConstants.confirmPasswordHint,
                              ),
                            ),
                          ),
                        ],
                      ),
                      (context.height * 0.03).heightBox,
                      TextFormField(
                        validator: AppValidators.phoneNumberValidator,
                        controller: viewModel.phoneNumberController,
                        decoration: InputDecoration(
                          labelText: AppConstants.phoneNumber,
                          hintText: AppConstants.phoneNumberHint,
                        ),
                      ),
                      (context.height * 0.05).heightBox,
                      SizedBox(
                        width: context.width,
                        child: ElevatedButton(
                          onPressed: viewModel.signUp,
                          child: Text(AppConstants.signUp),
                        ),
                      ),
                      (context.height * 0.02).heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppConstants.haveAccount,
                            style: AppStyles.mediumBlack16Style,
                          ),
                          (context.width * 0.02).widthBox,
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.loginScreen);
                            },
                            child: Text(
                              AppConstants.login,
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
