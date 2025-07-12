import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/core/theme/app_assets.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/extensions/project_extensions.dart';
import '../../project_layers/presentation_layer /authentication/signup/signup_view.dart';

abstract class Routes {
  static Route generateRoute(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? "/");

    switch (url.path) {
      case AppRoutes.signUpScreen:
      return MaterialPageRoute(builder: (_) => SignupView());
      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundScreen(),
        );
    }
  }
}



class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  AppAssets.noRoutes,
                  width: context.width,
                  height: context.height,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 50,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      FadeAnimatedText(
                          "404 Not Found ",
                          textStyle: TextStyle(fontWeight: FontWeight.w700,fontSize: 50,color: AppColors.white),
                          textAlign: TextAlign.center
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Oops! We couldn't find the page you're looking for.",
                  style: AppStyles.boldBlack26Style,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                (context.height * 0.02).heightBox,
                SizedBox(
                  width: context.width * 0.6,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
                    },
                    child: Text("Go to Home"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
