import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class SocialAuthButton extends StatelessWidget {
  final String title;
  final String svgPath;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  const SocialAuthButton({
    Key? key,
    required this.title,
    required this.svgPath,
    required this.onPressed,
    this.backgroundColor = AppColors.whiteColor,
    this.textColor = Colors.black87,
    this.borderColor = AppColors.colorDCDEDE,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(color: borderColor, width: 1.w),
          ),
          padding: EdgeInsets.symmetric(horizontal: 19.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(svgPath, width: 20.w, height: 20.h),
            SizedBox(width: 50.w),
            Flexible(
              child: Text(
                title,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
