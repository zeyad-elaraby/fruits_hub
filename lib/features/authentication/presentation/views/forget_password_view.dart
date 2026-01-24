import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/service_locator.dart';
import 'package:fruits_hub/core/widgets/custom_appbar.dart';
import 'package:fruits_hub/core/widgets/custom_snack_bar.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/reset_password_cubit/forget_password_cubit.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/reset_password_cubit/forget_password_state.dart';
import 'package:fruits_hub/features/authentication/presentation/widgets/forget_password_view_body.dart';
import 'package:fruits_hub/features/authentication/presentation/widgets/forget_password_view_body_bloc_consumer.dart';
import 'package:fruits_hub/generated/l10n.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ForgetPasswordCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: S.of(context).forgotThePassword,
          showNotification: false,
        ),
        body: ForgetPasswordViewBodyBlocConsumer(),
      ),
    );
  }
}
