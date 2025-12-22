import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

import 'notification_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.isBackButton = true,
  });
  final String title;
  final bool isBackButton;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(title, textAlign: TextAlign.center, style: TextStyles.bold19),
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      surfaceTintColor: AppColors.transparent,
      leading: isBackButton
          ? InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: EdgeInsetsDirectional.only(start: 16.w),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(
                    eccentricity: 0,
                    side: BorderSide(width: 1, color: AppColors.colorFFF1F1F5),
                  ),
                ),
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 16.33.w,
                  vertical: 15.6.h,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.blackColor,
                  size: 20.r,
                ),
              ),
            )
          : null,
      actions: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: 16.w),
          child: NotificationWidget(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
