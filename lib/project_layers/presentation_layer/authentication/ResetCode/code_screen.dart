import 'package:online_exam_app/project_layers/presentation_layer/authentication/ResetCode/code_viewModel.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:flutter/material.dart';

class CodeScreen extends StatelessWidget {
  CodeScreen({super.key});

  final CodeViewModel _codeViewModel = getIt.get<CodeViewModel>();
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
