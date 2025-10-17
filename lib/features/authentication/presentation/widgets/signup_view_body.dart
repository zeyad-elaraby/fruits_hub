import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/helper_functions/route_manager/app_routes.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_snack_bar.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_hub/features/authentication/presentation/widgets/terms_and_condition_widget.dart';
import 'package:fruits_hub/generated/l10n.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  bool isChecked = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var local = S.of(context);
    return SingleChildScrollView(
      padding: EdgeInsetsDirectional.only(top: 24.h, start: 16.w, end: 16.w),

      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextField(
              controller: name,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your name";
                }
                return null;
              },
              hintText: local.fullName,
              keyBoardType: TextInputType.name,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: email,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your email";
                }
                return null;
              },
              hintText: local.email,
              keyBoardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: password,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your password";
                }
                return null;
              },
              hintText: local.password,
              keyBoardType: TextInputType.visiblePassword,
              isObscured: true,
            ),
            SizedBox(height: 16.h),

            TermsAndConditionWidget(
              isChecked: isChecked,

              onChange: (value) {
                setState(() {
                  isChecked = value;
                });
              },
            ),
            SizedBox(height: 30.h),
            CustomElevatedButton(
              onPressed: () {
                print("EMAIL BEING SENT: '${email.text}'");
                if (formKey.currentState!.validate()) {
                  if (isChecked) {
                    context.read<SignupCubit>().createUserWithEmailAndPassword(
                      email.text.trim(),
                      password.text,
                      name.text,
                    );
                  } else {
                    customSnackBar(
                      context: context,
                      title: 'Error',
                      message: 'Please accept terms and conditions',
                      contentType: ContentType.failure,
                    );
                  }
                }
              },
              title: local.createNewAccount,
            ),
            SizedBox(height: 26.h),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: local.haveAccount,
                    style: TextStyles.semibold16.copyWith(
                      color: AppColors.color949D9E,
                    ),
                  ),
                  TextSpan(text: " "),
                  TextSpan(
                    text: local.login,
                    style: TextStyles.semibold16.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
