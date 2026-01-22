import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/route_manager/app_routes.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/cart/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruits_hub/features/cart/presentation/cubits/cart_item_cubit/cart_item_state.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CustomCartButtonBlocBuilder extends StatelessWidget {
  const CustomCartButtonBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomElevatedButton(
          title: S
              .of(context)
              .payButtonLabel(
                context.read<CartCubit>().cartEntity.calculateTotalPrice(),
              ),
          onPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.checkoutScreen,
              arguments: context.read<CartCubit>().cartEntity,
            );
          },
        );
      },
    );
  }
}
