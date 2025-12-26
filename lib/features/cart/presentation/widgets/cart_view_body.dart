import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_appbar.dart';
import 'package:fruits_hub/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/cart/presentation/widgets/cart_items_list.dart';
import 'package:fruits_hub/features/cart/presentation/widgets/custom_cart_button.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);
    return Stack(
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomAppBar(
                    title: locale.cart,
                    showNotification: false,
                    isBackButton: false,
                  ),
                  SizedBox(height: 16.h),

                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(color: AppColors.colorEBF9F1),
                    child: Text(
                      'لديك ${context.watch<CartCubit>().cartEntity.cartItems.length} منتجات في سله التسوق',
                      style: TextStyles.regular13.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 23),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : CustomDivider(),
            ),
            CartItemsList(
              cartItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : CustomDivider(),
            ),
          ],
        ),
        context.watch<CartCubit>().cartEntity.cartItems.isEmpty
            ? SizedBox.shrink()
            : Positioned(
                bottom: MediaQuery.of(context).size.height * 0.08,
                left: 16.w,
                right: 16.w,
                child: CustomCartButton(),
              ),
      ],
    );
  }
}
