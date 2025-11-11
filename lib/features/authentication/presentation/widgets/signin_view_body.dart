import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/helper_functions/route_manager/app_routes.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/validator.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/signin_cubit/cubit/signin_cubit.dart';
import 'package:fruits_hub/features/authentication/presentation/widgets/social_auth_button.dart';
import 'package:fruits_hub/generated/l10n.dart';

class SigninViewBody extends StatefulWidget {
  SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var local = S.of(context);
    return SingleChildScrollView(
      padding: EdgeInsetsDirectional.only(top: 24.h, start: 18.w, end: 18.w),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomTextField(
              validator: (value) => MyValidators.emailValidator(value),
              controller: emailController,
              hintText: local.email,
              keyBoardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              validator: (value) => MyValidators.passwordValidator(value),

              controller: passwordController,
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
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ),
            ),
            CustomElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<SigninCubit>(
                    context,
                  ).signinUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                }
              },
              title: local.login,
            ),
            SizedBox(height: 33.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  local.dontHaveAccount,
                  style: TextStyles.semibold16.copyWith(
                    color: AppColors.color949D9E,
                  ),
                ),
                SizedBox(width: 2.w),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.signupView);
                  },
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
              onPressed: () {
                BlocProvider.of<SigninCubit>(context).signinWithGoogle();
              },
            ),
            SizedBox(height: 16.h),
            Platform.isIOS
                ? Column(
                    children: [
                      SocialAuthButton(
                        title: local.signInWithApple,
                        svgPath: Assets.imagesAppleIcon,
                        onPressed: () {},
                      ),
                      SizedBox(height: 16.h),
                    ],
                  )
                : SizedBox.shrink(),
            SocialAuthButton(
              title: local.signInWithFacebook,
              svgPath: Assets.imagesFacebookIcon,
              onPressed: () {
                BlocProvider.of<SigninCubit>(context).signinWithFacebook();
              },
            ),
          ],
        ),
      ),
    );
  }
}
