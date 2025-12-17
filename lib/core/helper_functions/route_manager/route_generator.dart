import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_hub/core/helper_functions/route_manager/app_routes.dart';
import 'package:fruits_hub/features/authentication/presentation/views/signin_view.dart';
import 'package:fruits_hub/features/authentication/presentation/views/signup_view.dart';
import 'package:fruits_hub/features/best_selling_fruits/presentation/view/best_selling_view.dart';
import 'package:fruits_hub/features/home/presentation/views/home_view.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splashView:
      return MaterialPageRoute(builder: (context) => SplashView());
    case AppRoutes.onboardingView:
      return MaterialPageRoute(builder: (context) => OnBoardingView());
    case AppRoutes.signInView:
      return MaterialPageRoute(builder: (context) => SigninView());
    case AppRoutes.signupView:
      return MaterialPageRoute(builder: (context) => SignupView());
    case AppRoutes.homeView:
      return MaterialPageRoute(builder: (context) => HomeView());
    case AppRoutes.bestSellingView:
      return MaterialPageRoute(builder: (context) => BestSellingView());
    default:
      return MaterialPageRoute(
        builder: (context) =>
            Scaffold(body: Center(child: Text('No Route Found'))),
      );
  }
}
