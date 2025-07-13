import 'package:flutter/material.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/project_layers/presentation_layer/authentication/ForgotPassword/forgot_viewModel.dart';


class ForgotScreen extends StatelessWidget {
  ForgotScreen({super.key});

  final ForgotViewModel _forgotViewModel = getIt.get<ForgotViewModel>();
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
