import 'package:flutter/material.dart';

import '../../../../core/di/di.dart';
import '../authViewModel.dart';


class SignupView extends StatelessWidget {
  SignupView({super.key});

  final AuthViewModel _authViewModel = getIt.get<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
