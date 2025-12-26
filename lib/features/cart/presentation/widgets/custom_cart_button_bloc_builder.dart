
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/cart/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruits_hub/features/cart/presentation/cubits/cart_item_cubit/cart_item_state.dart';

class CustomCartButtonBlocBuilder extends StatelessWidget {
  const CustomCartButtonBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomElevatedButton(
          title:
              "الدفع  ${context.read<CartCubit>().cartEntity.calculateTotalPrice()} جنيه",
          onPressed: () {},
        );
      },
    );
  }
}
