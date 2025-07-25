import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/extensions/project_extensions.dart';
import 'package:online_exam_app/project_layers/presentation_layer/authentication/forget_password/cubit/forget_pass_states.dart';
import '../../../../../core/dialog/dialog.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/theme/app_validator.dart';
import '../cubit/forget_pass_view_model.dart';

class ResetPassBody extends StatelessWidget {
  const ResetPassBody({super.key, required this.viewModel});

  final ForgetPassViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPassViewModel, ForgetPassStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is ResetPassLoadingState) {
          // Show loading indicator
          DialogUtils.showLoading(
            context: context,
            loadingMessage: context.l10n.loading,
          );
        } else if (state is ResetPassSuccessState) {
          DialogUtils.hideLoading(context);
          //todo: implement reset password success logic, e.g., navigate to login screen
          DialogUtils.showMessage(
            context: context,
            content: context.l10n.reset_pass_success,
            posActions: context.l10n.ok,
          );
        } else if (state is ResetPassFailureState) {
          // Hide loading indicator and show error message
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            title: context.l10n.error,
            content: state.error.errorMessage,
            negActions: context.l10n.ok,
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Form(
              key: viewModel.resetPassFormKey,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      context.l10n.reset_password,
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: AppColors.black[100],
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.center,

                      context.l10n.reset_password_body,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: AppColors.grey.withValues(alpha: .8),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 17),
                    TextFormField(
                      validator:
                          (value) =>
                              AppValidators.passwordValidator(value, context),
                      onChanged: (value) => viewModel.validateResetPassBtn(),
                      controller: viewModel.newPassword,
                      keyboardType: TextInputType.visiblePassword,
                      style: AppStyles.regularBlack14Style,

                      decoration: InputDecoration(
                        labelText: context.l10n.new_password,
                        hintText: context.l10n.enter_your_password,
                      ),
                    ),
                    SizedBox(height: 17),

                    TextFormField(
                      validator:
                          (value) => AppValidators.confirmPasswordValidator(
                            value,
                            viewModel.newPassword,
                            context,
                          ),
                      style: AppStyles.regularBlack14Style,
                      onChanged: (value) => viewModel.validateResetPassBtn(),
                      controller: viewModel.confirmPassword,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: context.l10n.confirmPassword,
                        hintText: context.l10n.confirmPassword,
                      ),
                    ),

                    SizedBox(height: 33),

                    FilledButton(
                      onPressed:
                          viewModel.resetPassBtnEnabled
                              ? () {
                                //todo: implement forget password api and go to otp body
                                viewModel.newPassRequest(context);
                              }
                              : null,
                      child: Text(context.l10n.continue_btn),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
