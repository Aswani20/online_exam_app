import 'package:online_exam_app/project_layers/presentation_layer/authentication/ChangePassword/ChangePasswordViewModel.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/di.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final ChangePasswordViewModel _changePasswordViewModel = getIt.get<ChangePasswordViewModel>();
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
