import 'package:flutter/material.dart';
import 'package:online_exam_app/core/di/di.dart';

import '../authViewModel.dart';

class ForgotScreen extends StatelessWidget {
  ForgotScreen({super.key});

  final AuthViewModel _authViewModel = getIt.get<AuthViewModel>();
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
