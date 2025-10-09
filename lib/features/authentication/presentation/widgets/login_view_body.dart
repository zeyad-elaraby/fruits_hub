import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/authentication/presentation/widgets/social_auth_button.dart';
import 'package:fruits_hub/generated/l10n.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    var local = S.of(context);
    return SingleChildScrollView(
      padding: EdgeInsetsDirectional.only(top: 24.h, start: 18.w, end: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTextField(
            hintText: local.email,
            keyBoardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            hintText: local.password,
            keyBoardType: TextInputType.visiblePassword,
            isObscured: true,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 16.h, bottom: 33.h),
            child: InkWell(
              onTap: () {},
              child: Text(
                local.forgotPassword,
                style: TextStyles.semibold13.copyWith(
                  color: AppColors.colorGreen600,
                ),
              ),
            ),
          ),
          CustomElevatedButton(onPressed: () {}, title: local.login),
          SizedBox(height: 33.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                local.dontHaveAccount,
                style: TextStyles.semibold16.copyWith(
                  color: AppColors.color949d9e,
                ),
              ),
              SizedBox(width: 2.w),
              InkWell(
                onTap: () {},
                child: Text(
                  local.createAccount,
                  style: TextStyles.semibold16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 33.h),
          Row(
            children: [
              Expanded(child: Divider()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Text(local.or, style: TextStyles.semibold16),
              ),
              Expanded(child: Divider()),
            ],
          ),
          SizedBox(height: 21.h),
          SocialAuthButton(
            title: local.signInWithGoogle,
            svgPath: Assets.imagesGoogleIcon,
            onPressed: () {},
          ),
          SizedBox(height: 16.h),
          SocialAuthButton(
            title: local.signInWithApple,
            svgPath: Assets.imagesAppleIcon,
            onPressed: () {},
          ),
          SizedBox(height: 16.h),
          SocialAuthButton(
            title: local.signInWithFacebook,
            svgPath: Assets.imagesFacebookIcon,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
