import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/helper_functions/route_manager/app_routes.dart';
import 'package:fruits_hub/core/sevices/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/constants.dart';

class SpalshViewBody extends StatefulWidget {
  const SpalshViewBody({super.key});

  @override
  State<SpalshViewBody> createState() => _SpalshViewBodyState();
}

class _SpalshViewBodyState extends State<SpalshViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.imagesPlant, height: 172.h, width: 192.w),
          ],
        ),
        SvgPicture.asset(Assets.imagesAppLogo, height: 173.h, width: 178.w),
        SizedBox(
          height: 156.h,
          child: SvgPicture.asset(Assets.imagesSplashBottom, fit: BoxFit.fill),
        ),
      ],
    );
  }

  void excuteNavigation() {
    bool isOnBoardingCompleted = Prefs.getBool(kIsOnBoardingCompleted)??false;
    Future.delayed(const Duration(seconds: 2), () {
      if (isOnBoardingCompleted) {
        Navigator.pushReplacementNamed(context, AppRoutes.logInView);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.onboardingView);
      }
    });
  }
}
