import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/features/cart/domain/cart_item_entity.dart';
import 'package:fruits_hub/features/cart/presentation/widgets/cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: cartItems.length,

      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: CartItem(cartItemEntity: cartItems[index]),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const CustomDivider(),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: AppColors.colorF1F1F5, height: 4.h, thickness: 1);
  }
}
