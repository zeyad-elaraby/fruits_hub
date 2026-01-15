import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/custom_progress_hud.dart';
import 'package:fruits_hub/core/widgets/custom_snack_bar.dart';
import 'package:fruits_hub/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:fruits_hub/features/checkout/presentation/cubit/checkout_state.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CheckoutCubitBlocConsumer extends StatelessWidget {
  const CheckoutCubitBlocConsumer({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (BuildContext context, CheckoutState state) {
        if (state is CheckoutSuccess) {
          customSnackBar(
            context: context,
            title: S.of(context).success,
            message: S.of(context).orderAddedSuccessfully,
            contentType: ContentType.success,
          );
        }
        if (state is CheckoutError) {
          customSnackBar(
            context: context,
            title: S.of(context).error,
            message: state.errorMessage,
            contentType: ContentType.failure,
          );
        }
      },
      builder: (context, state) =>
          CustomProgressHud(isLoading: state is CheckoutLoading, child: child),
    );
  }
}
