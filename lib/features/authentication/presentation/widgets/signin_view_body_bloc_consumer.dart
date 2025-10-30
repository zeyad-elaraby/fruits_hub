import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_snack_bar.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/signin_cubit/cubit/signin_cubit.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/signin_cubit/cubit/signin_state.dart';
import 'package:fruits_hub/features/authentication/presentation/widgets/signin_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          customSnackBar(
            context: context,
            title: 'Success',
            message: 'Account signed in successfully',
            contentType: ContentType.success,
          );
        }
        if (state is SigninError) {
          customSnackBar(
            context: context,
            title: 'Error',
            message: state.message,
            contentType: ContentType.failure,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SigninLoading,
          child: SigninViewBody(),
        );
      },
    );
  }
}
