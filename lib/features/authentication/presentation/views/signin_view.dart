import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/service_locator.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/authentication/presentation/widgets/custom_auth_app_bar.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/signin_cubit/cubit/signin_cubit.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/signin_cubit/cubit/signin_state.dart';
import 'package:fruits_hub/features/authentication/presentation/widgets/signin_view_body.dart';
import 'package:fruits_hub/features/authentication/presentation/widgets/signin_view_body_bloc_consumer.dart';
import 'package:fruits_hub/generated/l10n.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAuthAppBar(title: S.of(context).login),
      body: BlocProvider(
        create: (context) => sl<SigninCubit>(),
        child: SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
