import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/generated/l10n.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({
    super.key,
    required this.isChecked,
    required this.onChange,
  });

  final bool isChecked;
  final ValueChanged<bool> onChange;
  @override
  Widget build(BuildContext context) {
    var local = S.of(context);
    return GestureDetector(
      onTap: () {
        onChange(!isChecked);
      },
      child: Row(
        children: [
          AnimatedContainer(
            width: 24,
            height: 24,
            duration: Duration(milliseconds: 200),
            decoration: ShapeDecoration(
              color: isChecked ? AppColors.primaryColor : Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1.50,
                  color: isChecked
                      ? AppColors.transparent
                      : const Color(0xFFDCDEDE),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: isChecked
                ? SvgPicture.asset(
                    Assets.imagesCheckIcon,
                    height: 16.h,
                    width: 16.w,
                  )
                : SizedBox.shrink(),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: local.termsAndConditionsPrefix,
                    style: TextStyles.semibold13.copyWith(
                      color: AppColors.color949D9E,
                    ),
                  ),
                  TextSpan(text: " "),
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    text: local.termsAndConditionsSuffix,
                    style: TextStyles.semibold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
