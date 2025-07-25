import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/extensions/project_extensions.dart';
import 'package:flutter/services.dart';
import '../../../../../core/dialog/dialog.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../cubit/forget_pass_states.dart';
import '../cubit/forget_pass_view_model.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({super.key, required this.viewModel});

  final ForgetPassViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: viewModel,
      listener: (context, state) {
        if (state is OtpLoadingState) {
          // Show loading indicator
          DialogUtils.showLoading(
            context: context,
            loadingMessage: context.l10n.loading,
          );
        } else if (state is OtpSuccessState) {
          DialogUtils.hideLoading(context);
        } else if (state is ForgetPassSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: context.l10n.otp_resend_to_mail,
            negActions: context.l10n.ok,
          );
        } else if (state is OtpFailureState) {
          // Hide loading indicator and show error message
          DialogUtils.hideLoading(context);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: SingleChildScrollView(
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    context.l10n.email_verification,
                    style: context.textTheme.headlineSmall?.copyWith(
                      color: AppColors.black[100],
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,

                    context.l10n.enter_code_sent_to_email,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: AppColors.grey.withValues(alpha: .8),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 17),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        height: 50,
                        width: 45,
                        child: TextField(
                          controller: viewModel.otpControllers[index],
                          focusNode: viewModel.otpFocusNodes[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          obscureText: true,
                          textAlignVertical: TextAlignVertical.center,
                          style: AppStyles.regularBlack14Style,
                          decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            fillColor:
                                state is! OtpFailureState
                                    ? AppColors.blue[10]
                                    : AppColors.white,
                            border:
                                state is OtpFailureState
                                    ? OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.red,
                                      ),
                                    )
                                    : OutlineInputBorder(),
                            enabledBorder:
                                state is OtpFailureState
                                    ? OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.red,
                                      ),
                                    )
                                    : OutlineInputBorder(),
                            focusedBorder:
                                state is OtpFailureState
                                    ? OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.red,
                                      ),
                                    )
                                    : OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            if (value.length == 1 && index < 5) {
                              FocusScope.of(context).requestFocus(
                                viewModel.otpFocusNodes[index + 1],
                              );
                            } else if (value.isEmpty && index > 0) {
                              FocusScope.of(context).requestFocus(
                                viewModel.otpFocusNodes[index - 1],
                              );
                            }
                            viewModel.validateOtpBtn();
                          },
                        ),
                      );
                    }),
                  ),
                  if (state is! OtpFailureState) SizedBox(height: 5),
                  if (state is OtpFailureState)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          context.l10n.invalid_code,
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: AppColors.red,
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: 20),
                  FilledButton(
                    onPressed:
                        viewModel.otpBtnEnabled
                            ? () {
                              //todo: go to reset password body
                              viewModel.otpValidationRequest(context);
                            }
                            : null,
                    child: Text(context.l10n.continue_btn),
                  ),
                  SizedBox(height: 20),

                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "${context.l10n.didnt_receive_code} ",
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: AppColors.black,
                      ),
                      children: [
                        TextSpan(
                          text: context.l10n.resend,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  //todo: implement resend code logic
                                  viewModel.resendOtp(context);
                                },
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
    );
  }
}
