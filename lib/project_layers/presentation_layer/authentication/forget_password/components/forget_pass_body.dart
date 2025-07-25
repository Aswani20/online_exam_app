import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/dialog/dialog.dart';
import 'package:online_exam_app/extensions/project_extensions.dart';
import 'package:online_exam_app/project_layers/presentation_layer/authentication/forget_password/cubit/forget_pass_states.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/theme/app_validator.dart';
import '../cubit/forget_pass_view_model.dart';

class ForgetPassBody extends StatelessWidget {
  const ForgetPassBody({super.key, required this.viewModel});

  final ForgetPassViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPassViewModel, ForgetPassStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is ForgetPassLoadingState) {
          // Show loading indicator
          DialogUtils.showLoading(
            context: context,
            loadingMessage: context.l10n.loading,
          );
        } else if (state is ForgetPassSuccessState) {
          DialogUtils.hideLoading(context);
        } else if (state is ForgetPassFailureState) {
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
              key: viewModel.forgetPassFormKey,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      context.l10n.forget_password,
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: AppColors.black[100],
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.center,

                      context.l10n.enter_your_email_associated,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: AppColors.grey.withValues(alpha: .8),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 17),
                    TextFormField(
                      validator:
                          (value) =>
                              AppValidators.emailValidator(value, context),
                      onChanged: (value) => viewModel.validateForgetPassBtn(),
                      controller: viewModel.email,
                      keyboardType: TextInputType.emailAddress,
                      style: AppStyles.regularBlack14Style,
                      decoration: InputDecoration(
                        labelText: context.l10n.email,
                        hintText: context.l10n.emailHint,
                      ),
                    ),

                    SizedBox(height: 33),

                    FilledButton(
                      onPressed:
                          viewModel.forgetPassBtnEnabled
                              ? () {
                                viewModel.forgetPasswordRequest(context);
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
