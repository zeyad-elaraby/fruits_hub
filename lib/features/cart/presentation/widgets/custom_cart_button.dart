import 'package:flutter/material.dart';
import 'package:fruits_hub/features/cart/presentation/widgets/custom_cart_button_bloc_builder.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCartButtonBlocBuilder();
  }
}
