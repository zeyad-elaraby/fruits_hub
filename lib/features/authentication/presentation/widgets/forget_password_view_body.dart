import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/validator.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/reset_password_cubit/forget_password_cubit.dart';
import 'package:fruits_hub/generated/l10n.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  late GlobalKey<FormState> formKey;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String email = '';

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Text(
              S.of(context).forgotPasswordEmailDescription,
              style: TextStyles.semibold16.copyWith(
                color: AppColors.color616A6B,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: CustomTextField(
                validator: (value) => MyValidators.emailValidator(value),
                onSaved: (value) {
                  if (value != null) {
                    email = value;
                  }
                },
              ),
            ),
            CustomElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context.read<ForgetPasswordCubit>().forgetPassword(email);
                } else {
                  autovalidateMode = AutovalidateMode.onUserInteraction;
                }
              },
              title: S.of(context).sendTheLink,
            ),
          ],
        ),
      ),
    );
  }
}
