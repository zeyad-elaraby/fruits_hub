import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({
    super.key,
    required this.text,
    required this.stepNumber,
  });

  final String text, stepNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11.5.r,
          backgroundColor: AppColors.colorF2F3F3,
          child: Text(stepNumber, style: TextStyles.semibold13),
        ),
        SizedBox(width: 4.w),
        Text(
          text,
          style: TextStyles.semibold13.copyWith(color: AppColors.colorAAAAAA),
        ),
      ],
    );
  }
}
