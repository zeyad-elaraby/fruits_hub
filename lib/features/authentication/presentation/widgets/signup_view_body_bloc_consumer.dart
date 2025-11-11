import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_snack_bar.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/signup_cubit/signup_state.dart';
import 'package:fruits_hub/features/authentication/presentation/widgets/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.pop(context);
          customSnackBar(
            context: context,
            title: 'Success',
            message: 'Account created successfully',
            contentType: ContentType.success,
          );
        }
        if (state is SignUpError) {
          customSnackBar(
            context: context,
            title: 'Error',
            message: state.message,
            contentType: ContentType.failure,
          );
          print(state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading,
          child: SignupViewBody(),
        );
      },
    );
  }
}
