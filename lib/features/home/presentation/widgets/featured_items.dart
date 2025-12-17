import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: itemWidth,

      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: Stack(
            children: [
              Image.asset(Assets.imagesFeaturedItemTest),
              Container(
                width: itemWidth * .5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Svg(Assets.imagesFeaturedItemBackground),

                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25.h),
                      Text(
                        'عروض العيد',
                        style: TextStyles.regular13.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'خصم 25%',
                        style: TextStyles.bold19.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(height: 7.h),
                      SizedBox(
                        width: 116.w,
                        child: CustomElevatedButton(
                          onPressed: () {},
                          height: 32.h,
                          width: 116.w,

                          backGroundColor: AppColors.whiteColor,
                          radius: 4.r,
                          title: 'تسوق الان',
                          textStyle: TextStyles.semibold13.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 29.h),
                    ],
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
