import 'package:flutter/material.dart';
import 'package:online_exam_app/core/l10n/translation/app_localizations.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/project_layers/presentation_layer%20/authentication/signup/signup_view.dart';

abstract class Routes {
  static Route generateRoute(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? "/");

    switch (url.path) {
      case AppRoutes.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignupView());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(),
                Text(AppLocalizations.of(context)!.appName),
                FilledButton(onPressed: () {}, child: Text("Test")),
              ],
            ),
          ),
        );
    }
  }
}
