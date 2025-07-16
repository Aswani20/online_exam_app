import 'package:online_exam_app/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/project_layers/presentation_layer/authentication/authViewModel.dart';

class CodeScreen extends StatelessWidget {
  CodeScreen({super.key});

  final AuthViewModel _authViewModel = getIt.get<AuthViewModel>();
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
