import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/cart/domain/cart_item_entity.dart';
import 'package:fruits_hub/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/cart/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItem});
  final CartItemEntity cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemButton(
          onPressed: () {
            cartItem.increaseCount();
            context.read<CartItemCubit>().updateCartItem(cartItem);
          },
          backgroundColor: AppColors.primaryColor,
          icon: Icons.add,
          iconColor: AppColors.whiteColor,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(cartItem.count.toString(), style: TextStyles.bold16),
        ),
        CartItemButton(
          onPressed: () {
            if (cartItem.count == 1) {
              context.read<CartCubit>().removeCartItem(cartItem);
            } else {
              cartItem.decreaseCount();
              context.read<CartItemCubit>().updateCartItem(cartItem);
            }
          },
          backgroundColor: AppColors.colorf3f5f7,
          icon: Icons.remove,
          iconColor: AppColors.color979899,
        ),
      ],
    );
  }
}

class CartItemButton extends StatelessWidget {
  const CartItemButton({
    super.key,
    this.onPressed,
    required this.backgroundColor,
    required this.icon,
    required this.iconColor,
  });
  final Function()? onPressed;
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 12.r,
      backgroundColor: backgroundColor,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: Icon(icon, color: iconColor, size: 16.sp),
      ),
    );
  }
}
