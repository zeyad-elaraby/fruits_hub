import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/payment_cart_item.dart';
import 'package:fruits_hub/features/cart/domain/cart_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/generated/l10n.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    CartEntity cartEntity = context.read<OrderEntity>().cartEntity;
    return PaymentCardItem(
      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 15.h),
      headerTitle: locale.order_summary,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${locale.subtotal} :", style: TextStyles.regular13),
              Text(
                "${cartEntity.calculateTotalPrice()} ${locale.egPound}",
                style: TextStyles.semibold16,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Visibility(
            visible: context.read<OrderEntity>().payWithCash == true,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${locale.delivery} :", style: TextStyles.regular13),
                Text("30 ${locale.egPound}", style: TextStyles.semibold13),
              ],
            ),
          ),

          Divider(
            color: AppColors.colorCACECE,
            height: 8.h,
            thickness: 0.5,
            indent: 32.w,
            endIndent: 32.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${locale.total} :", style: TextStyles.bold16),
              Text(
                "${cartEntity.calculateTotalPrice() + 30} ${locale.egPound}",
                style: TextStyles.bold16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
