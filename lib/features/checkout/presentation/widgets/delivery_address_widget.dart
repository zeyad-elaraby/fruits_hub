import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/payment_cart_item.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:fruits_hub/features/checkout/presentation/widgets/edit_address_botton_sheet.dart';
import 'package:fruits_hub/generated/l10n.dart';

class DeliveryAddressWidget extends StatefulWidget {
  const DeliveryAddressWidget({super.key});

  @override
  State<DeliveryAddressWidget> createState() => _DeliveryAddressWidgetState();
}

class _DeliveryAddressWidgetState extends State<DeliveryAddressWidget> {
  @override
  Widget build(BuildContext context) {
    OrderEntity orderEntity = context.read<OrderEntity>();
    final locale = S.of(context);
    var checkoutCubit = context.read<CheckoutCubit>();
    return PaymentCardItem(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(locale.delivery_address, style: TextStyles.bold13),
              GestureDetector(
                onTap: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => BlocProvider.value(
                      value: checkoutCubit,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(35.r),
                          ),
                        ),
                        child: EditAddressBottomSheet(orderEntity: orderEntity),
                      ),
                    ),
                  );
                  setState(() {});
                },
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.imagesEdit, fit: BoxFit.scaleDown),
                    SizedBox(width: 4.w),
                    Text(
                      locale.edit,
                      style: TextStyles.semibold13.copyWith(
                        color: AppColors.color949D9E,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              SvgPicture.asset(Assets.imagesLocation, fit: BoxFit.scaleDown),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  "${orderEntity.shippingAddress?.address}, ${orderEntity.shippingAddress?.city}, ${orderEntity.shippingAddress?.floor}",
                  style: TextStyles.regular16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
