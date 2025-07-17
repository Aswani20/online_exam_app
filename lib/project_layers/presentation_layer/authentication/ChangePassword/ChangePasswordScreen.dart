import 'package:flutter/material.dart';
import 'package:online_exam_app/project_layers/presentation_layer/authentication/authViewModel.dart';

import '../../../../core/di/di.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final AuthViewModel _authViewModel = getIt.get<AuthViewModel>();
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
