import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/features/checkout/presentation/widgets/delivery_address_widget.dart';
import 'package:fruits_hub/features/checkout/presentation/widgets/order_summary_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.h),
        OrderSummaryWidget(),
        SizedBox(height: 16.h),
        DeliveryAddressWidget(),
      ],
    );
  }
}
