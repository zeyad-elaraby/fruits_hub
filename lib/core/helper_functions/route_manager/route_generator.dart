import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper_functions/route_manager/app_routes.dart';
import 'package:fruits_hub/features/authentication/presentation/views/signin_view.dart';
import 'package:fruits_hub/features/authentication/presentation/views/signup_view.dart';
import 'package:fruits_hub/features/cart/domain/cart_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruits_hub/features/home/presentation/views/best_selling_view.dart';
import 'package:fruits_hub/features/layout/presentation/views/main_view.dart';
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
    case AppRoutes.mainView:
      return MaterialPageRoute(builder: (context) => MainView());
    case AppRoutes.bestSellingView:
      return MaterialPageRoute(builder: (context) => BestSellingView());
    case AppRoutes.checkoutScreen:
      return MaterialPageRoute(
        builder: (context) =>
            CheckoutView(cartEntity: settings.arguments as CartEntity),
      );
    default:
      return MaterialPageRoute(
        builder: (context) =>
            Scaffold(body: Center(child: Text('No Route Found'))),
      );
  }
}
