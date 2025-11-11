import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/helper_functions/route_manager/app_routes.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/constants.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.background,
    required this.isVisible,
  });
  final Widget title;
  final String subTitle;
  final String image;
  final String background;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.45,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(background, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(image, height: 270.h, width: 249.5.w),
              ),
              Positioned(
                right: 10.w,
                top: 10.h,
                child: Visibility(
                  visible: isVisible,
                  child: GestureDetector(
                    onTap: () {
                      Prefs.setBool(kIsOnBoardingCompleted, true);

                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.signInView,
                      );
                    },
                    child: Text('تخط'),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 64.h),
        title,
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 37.w),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyles.semibold13.copyWith(color: AppColors.color4E5556),
          ),
        ),
      ],
    );
  }
}
