import 'package:flutter/material.dart';
import 'package:online_exam_app/extensions/project_extensions.dart';
import 'package:online_exam_app/project_layers/domain_layer/use_casses/forget_pass_use_case.dart';
import 'package:online_exam_app/project_layers/presentation_layer/authentication/forget_password/components/forget_pass_body.dart';
import 'package:online_exam_app/project_layers/presentation_layer/authentication/forget_password/components/reset_pass_body.dart';
import 'package:online_exam_app/project_layers/presentation_layer/authentication/forget_password/cubit/forget_pass_view_model.dart';
import '../../../../core/di/di.dart';
import '../../../domain_layer/use_casses/otp_use_case.dart';
import '../../../domain_layer/use_casses/reset_pass_use_case.dart';
import 'components/otp_body.dart';

class ForgetPassWordScreen extends StatelessWidget {
  ForgetPassWordScreen({super.key});

  ForgetPassViewModel viewModel = ForgetPassViewModel(
    forgetPassUseCase: getIt<ForgetPassUseCase>(),
    otpUseCase: getIt<OtpUseCase>(),
    resetPassUseCase: getIt<ResetPassUseCase>(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.password),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 8),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        leadingWidth: 30,
      ),
      body: PageView(
        controller: viewModel.pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ForgetPassBody(viewModel: viewModel),
          OtpBody(viewModel: viewModel),
          ResetPassBody(viewModel: viewModel),
        ],
      ),
    );
    ;
  }
}
