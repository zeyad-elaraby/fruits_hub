import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class BestSellingItem extends StatelessWidget {
  const BestSellingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: 200.w,
      decoration: BoxDecoration(
        color: AppColors.colorf3f5f7,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Image.asset(
                  Assets.imagesWatermellonTest,
                  width: 131.w,
                  height: 99.h,
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 8.5.w, end: 7.5.w),
                  child: ListTile(
                    title: Text('بطيخ', style: TextStyles.semibold13),
                    subtitle: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '20جنية',
                            style: TextStyles.bold13.copyWith(
                              color: AppColors.colorF4A91F,
                            ),
                          ),
                          TextSpan(
                            text: '/',
                            style: TextStyles.semibold13.copyWith(
                              color: AppColors.colorF8C76D,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyles.semibold13.copyWith(
                              color: AppColors.colorF8C76D,
                            ),
                          ),
                          TextSpan(
                            text: 'كيلو',
                            style: TextStyles.semibold13.copyWith(
                              color: AppColors.colorF8C76D,
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: CircleAvatar(
                      radius: 18.w,
                      backgroundColor: AppColors.primaryColor,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: AppColors.whiteColor,
                          size: 16.w,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
