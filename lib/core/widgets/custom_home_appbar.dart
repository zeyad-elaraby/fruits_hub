import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper_functions/get_user_data.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/notification_widget.dart';
import 'package:fruits_hub/generated/l10n.dart';

class MainAppbar extends StatelessWidget {
  const MainAppbar({super.key});

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
        getUserData().name,
        style: TextStyles.bold16.copyWith(color: AppColors.blackColor),
      ),

      trailing: NotificationWidget(),
    );
  }
}
