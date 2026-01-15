import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/features/cart/domain/cart_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

import 'package:fruits_hub/features/checkout/presentation/widgets/shipping_option.dart';
import 'package:fruits_hub/generated/l10n.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var locale = S.of(context);
    OrderEntity orderEntity = context.read<OrderEntity>();
    return Column(
      children: [
        SizedBox(height: 32.h),
        ShippingOption(
          title: locale.cashOnDelivery,
          subTitle: locale.pickupFromLocation,
          price: (orderEntity.cartEntity.calculateTotalPrice() + 30).toString(),
          isSelected: selectedIndex == 0,
          onTap: () {
            setState(() {
              selectedIndex = 0;
              orderEntity.payWithCash = true;
            });
          },
        ),
        SizedBox(height: 8.h),
        ShippingOption(
          title: locale.onlinePayment,
          subTitle: locale.pleaseSelectPaymentMethod,
          price: orderEntity.cartEntity.calculateTotalPrice().toString(),
          isSelected: selectedIndex == 1,
          onTap: () {
            setState(() {
              selectedIndex = 1;
              orderEntity.payWithCash = false;
            });
          },
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
