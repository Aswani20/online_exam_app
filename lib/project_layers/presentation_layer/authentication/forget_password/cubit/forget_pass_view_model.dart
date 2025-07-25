import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/extensions/project_extensions.dart';
import 'package:online_exam_app/project_layers/domain_layer/use_casses/forget_pass_use_case.dart';
import 'package:online_exam_app/project_layers/domain_layer/use_casses/reset_pass_use_case.dart';
import 'package:online_exam_app/project_layers/presentation_layer/authentication/forget_password/cubit/forget_pass_states.dart';

import '../../../../domain_layer/use_casses/otp_use_case.dart';

@injectable
class ForgetPassViewModel extends Cubit<ForgetPassStates> {
  ForgetPassUseCase forgetPassUseCase;
  OtpUseCase otpUseCase;
  ResetPassUseCase resetPassUseCase;

  ForgetPassViewModel({
    required this.forgetPassUseCase,
    required this.otpUseCase,
    required this.resetPassUseCase,
  }) : super(ForgetPassInitState());

  // forgetPasswordScreen attributes
  PageController pageController = PageController(initialPage: 0);

  // forgetPassword body attributes and behaviors
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> forgetPassFormKey = GlobalKey<FormState>();
  bool forgetPassBtnEnabled = false;

  void validateForgetPassBtn() {
    if (email.text.isNotEmpty && email.text != '') {
      forgetPassBtnEnabled = true;
      emit(ForgetPassBtnValidationState(isBtnEnabled: forgetPassBtnEnabled));
    } else {
      forgetPassBtnEnabled = false;
      emit(ForgetPassBtnValidationState(isBtnEnabled: forgetPassBtnEnabled));
    }
  }

  void forgetPasswordRequest(BuildContext context) async {
    if (forgetPassFormKey.currentState?.validate() ?? false) {
      emit(ForgetPassLoadingState());
      var either = await forgetPassUseCase.invoke(
        email: email.text,
        networkError: context.l10n.network_error,
        serverError: context.l10n.server_error,
      );
      either.fold(
        (l) {
          emit(ForgetPassSuccessState());
          pageController.animateToPage(
            1,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          emit(OtpInitState());
        },
        (r) {
          emit(ForgetPassFailureState(error: r));
        },
      );
    }
  }

  // otp body attributes and behaviors
  List<TextEditingController> otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  List<FocusNode> otpFocusNodes = List.generate(6, (index) => FocusNode());
  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  bool otpBtnEnabled = false;

  void otpTextFieldOnChange(String value, int index, BuildContext context) {
    if (value.length == 1 && index < 5) {
      FocusScope.of(context).requestFocus(otpFocusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(otpFocusNodes[index - 1]);
    }
    validateOtpBtn();
  }

  void validateOtpBtn() {
    otpBtnEnabled =
        !otpControllers.any((controller) => controller.text.isEmpty);
    emit(OtpBtnValidationState(isBtnEnabled: otpBtnEnabled));
  }

  void onPasteOtp(pastedText) {
    final characters = pastedText.split('');
    for (int i = 0; i < otpControllers.length; i++) {
      if (i < characters.length) {
        otpControllers[i].text = characters[i];
      } else {
        otpControllers[i].clear();
      }
    }
    otpFocusNodes.last.requestFocus();
    validateOtpBtn();
  }

  void otpValidationRequest(BuildContext context) async {
    emit(OtpLoadingState());
    var either = await otpUseCase.invoke(
      code: otpControllers.map((controller) => controller.text).join(),
      networkError: context.l10n.network_error,
      serverError: context.l10n.server_error,
    );
    either.fold(
      (l) {
        emit(OtpSuccessState());
        pageController.animateToPage(
          2,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        emit(ResetPassInitState());
      },
      (r) {
        emit(OtpFailureState(error: r));
      },
    );
  }

  void resendOtp(BuildContext context) async {
    emit(OtpLoadingState());
    var either = await forgetPassUseCase.invoke(
      email: email.text,
      networkError: context.l10n.network_error,
      serverError: context.l10n.server_error,
    );
    either.fold(
      (l) {
        emit(ForgetPassSuccessState());
      },
      (r) {
        emit(OtpFailureState(error: r));
      },
    );
  }

  // resetPassword body attributes and behaviors
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool resetPassBtnEnabled = false;
  GlobalKey<FormState> resetPassFormKey = GlobalKey<FormState>();

  void validateResetPassBtn() {
    if (newPassword.text.isNotEmpty &&
        confirmPassword.text.isNotEmpty &&
        newPassword.text != '' &&
        confirmPassword.text != '') {
      resetPassBtnEnabled = true;
      emit(ResetPassBtnValidationState(isBtnEnabled: resetPassBtnEnabled));
    } else {
      resetPassBtnEnabled = false;
      emit(ResetPassBtnValidationState(isBtnEnabled: resetPassBtnEnabled));
    }
  }

  void newPassRequest(BuildContext context) async {
    if (resetPassFormKey.currentState?.validate() ?? false) {
      emit(ResetPassLoadingState());
      var either = await resetPassUseCase.invoke(
        email: email.text,
        newPassword: newPassword.text,
        networkError: context.l10n.network_error,
        serverError: context.l10n.server_error,
      );
      either.fold(
        (l) {
          emit(ResetPassSuccessState());
          //todo: implement navigation to login screen
        },
        (r) {
          emit(ResetPassFailureState(error: r));
        },
      );
    }
  }
}
