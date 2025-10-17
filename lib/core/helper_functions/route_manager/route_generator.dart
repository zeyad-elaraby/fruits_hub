import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_hub/core/helper_functions/route_manager/app_routes.dart';
import 'package:fruits_hub/features/authentication/presentation/views/login_view.dart';
import 'package:fruits_hub/features/authentication/presentation/views/signup_view.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splashView:
      return MaterialPageRoute(builder: (context) => SplashView());
    case AppRoutes.onboardingView:
      return MaterialPageRoute(builder: (context) => OnBoardingView());
    case AppRoutes.logInView:
      return MaterialPageRoute(builder: (context) => LoginView());
    case AppRoutes.registerView:
      return MaterialPageRoute(builder: (context) => SignupView());
    default:
      return MaterialPageRoute(
        builder: (context) =>
            Scaffold(body: Center(child: Text('No Route Found'))),
      );
  }
}
