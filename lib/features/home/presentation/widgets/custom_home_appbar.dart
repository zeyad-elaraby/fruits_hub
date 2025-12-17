import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/service_locator.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/notification_widget.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    var local = S.of(context);

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(Assets.imagesProfileImage),
      title: Text(
        local.goodMorning,
        style: TextStyles.regular16.copyWith(color: AppColors.color949D9E),
      ),
      subtitle: Text(
        sl<FirebaseAuthService>().getUserData().name,
        style: TextStyles.bold16.copyWith(color: AppColors.blackColor),
      ),

      trailing: NotificationWidget(),
    );
  }
}
