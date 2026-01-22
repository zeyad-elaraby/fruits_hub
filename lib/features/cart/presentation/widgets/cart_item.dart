import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_cached_network_image.dart';
import 'package:fruits_hub/features/cart/domain/cart_item_entity.dart';
import 'package:fruits_hub/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/cart/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruits_hub/features/cart/presentation/cubits/cart_item_cubit/cart_item_state.dart';
import 'package:fruits_hub/features/cart/presentation/widgets/cart_item_action_buttons.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        log("we are building cart item");
        return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 73.w,
                height: 92.h,
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(color: AppColors.colorf3f5f7),
                child: CustomCachedNetworkImage(
                  imageUrl: cartItemEntity.product.imageUrl,
                  boxFit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(width: 17.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cartItemEntity.product.name,
                          style: TextStyles.bold13,
                        ),
                        InkWell(
                          onTap: () {
                            context.read<CartCubit>().removeCartItem(
                              cartItemEntity,
                            );
                          },
                          child: SvgPicture.asset(Assets.imagesTrash),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 2.h,
                        bottom: 12.h,
                      ),
                      child: Text(
                        "${locale.weightInKilos(cartItemEntity.calculateTotalUnitAmount())}",
                        textAlign: TextAlign.right,
                        style: TextStyles.regular13.copyWith(
                          color: AppColors.colorF4A91F,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CartItemActionButtons(cartItem: cartItemEntity),
                        Text(
                          "${cartItemEntity.calculateTotalPrice()} ${locale.egPound} ",
                          style: TextStyles.bold16.copyWith(
                            color: AppColors.colorF4A91F,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
