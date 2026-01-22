import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/generated/l10n.dart';

class ShippingOption extends StatelessWidget {
  const ShippingOption({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String subTitle;
  final String price;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsetsDirectional.only(
          top: 16.h,
          bottom: 16.h,
          start: 13.w,
          end: 28.w,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: AppColors.colorF7F7F7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
            side: BorderSide(
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.colorF7F7F7,
              width: 1.w,
            ),
          ),
        ),

        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected
                  ? Container(
                      width: 18.w,
                      height: 18.h,
                      decoration: ShapeDecoration(
                        color: AppColors.primaryColor,
                        shape: OvalBorder(
                          side: BorderSide(
                            width: 4.w,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      width: 18.w,
                      height: 18.h,
                      decoration: ShapeDecoration(
                        shape: OvalBorder(
                          side: BorderSide(
                            width: 1.w,
                            color: AppColors.color949D9E,
                          ),
                        ),
                      ),
                    ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyles.semibold13),
                  SizedBox(width: 6.w),
                  Text(
                    subTitle,
                    style: TextStyles.regular13.copyWith(
                      color: AppColors.blackColor.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: Text(
                  '$price ${S.of(context).egPound}',
                  style: TextStyles.bold13.copyWith(
                    color: AppColors.color3A8B33,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
