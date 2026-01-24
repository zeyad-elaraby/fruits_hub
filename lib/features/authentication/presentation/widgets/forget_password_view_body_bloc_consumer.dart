import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/custom_progress_hud.dart';
import 'package:fruits_hub/core/widgets/custom_snack_bar.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/reset_password_cubit/forget_password_cubit.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/reset_password_cubit/forget_password_state.dart';
import 'package:fruits_hub/features/authentication/presentation/widgets/forget_password_view_body.dart';
import 'package:fruits_hub/generated/l10n.dart';

class ForgetPasswordViewBodyBlocConsumer extends StatelessWidget {
  const ForgetPasswordViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          customSnackBar(
            context: context,
            title: locale.success,
            message: locale.verificationEmailSentSuccessfully,
            contentType: ContentType.success,
          );
          Navigator.pop(context);
        }
        if (state is ForgetPasswordFailure) {
          customSnackBar(
            context: context,
            title: locale.error,
            message: state.message,
            contentType: ContentType.failure,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is ForgetPasswordLoading,
          child: ForgetPasswordViewBody(),
        );
      },
    );
  }
}
