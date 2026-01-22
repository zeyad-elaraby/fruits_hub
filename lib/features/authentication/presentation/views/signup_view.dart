import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/service_locator.dart';
import 'package:fruits_hub/features/authentication/presentation/widgets/custom_auth_app_bar.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/signup_cubit/signup_state.dart';
import 'package:fruits_hub/features/authentication/presentation/widgets/signup_view_body.dart';
import 'package:fruits_hub/features/authentication/presentation/widgets/signup_view_body_bloc_consumer.dart';
import 'package:fruits_hub/generated/l10n.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SignupCubit>(),
      child: Scaffold(
        appBar: SecondaryAppBar(title: S.of(context).newAccount),
        body: SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
