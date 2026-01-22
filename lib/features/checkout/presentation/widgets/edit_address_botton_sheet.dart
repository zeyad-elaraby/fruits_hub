import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/validator.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:fruits_hub/generated/l10n.dart';

class EditAddressBottomSheet extends StatelessWidget {
  const EditAddressBottomSheet({super.key, required this.orderEntity});

  final OrderEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 20),
            child: Text("تعديل العنوان", style: TextStyles.bold19),
          ),
          CustomTextField(
            hintText: orderEntity.shippingAddress?.address ?? "العنوان",
            validator: (value) => MyValidators.genericValidator(value: value),
            onSaved: (value) {
              if (value != null) {
                orderEntity.shippingAddress!.address = value;
              }
            },
          ),
          CustomTextField(
            validator: (value) => MyValidators.genericValidator(value: value),
            hintText: orderEntity.shippingAddress?.city ?? "المدينه",
            onSaved: (value) {
              if (value != null) {
                orderEntity.shippingAddress!.city = value;
              }
            },
          ),
          CustomTextField(
            validator: (value) => MyValidators.genericValidator(value: value),
            hintText:
                orderEntity.shippingAddress?.floor ??
                "رقم الطابق , رقم الشقه ..",
            onSaved: (value) {
              if (value != null) {
                orderEntity.shippingAddress!.floor = value;
              }
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.05,
              vertical: 16,
            ),
            child: CustomElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  log("${orderEntity.shippingAddress?.address}");
                  log("${orderEntity.shippingAddress?.city}");
                  log("${orderEntity.shippingAddress?.floor}");
                  log("${orderEntity.cartEntity.cartItems.length}");
                  context.read<CheckoutCubit>().triggerAddressUpdate();
                  Navigator.of(context).pop();
                }
              },
              title: locale.edit,
            ),
          ),
        ],
      ),
    );
  }
}
