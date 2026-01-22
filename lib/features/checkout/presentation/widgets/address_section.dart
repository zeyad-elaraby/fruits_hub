import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/validator.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:fruits_hub/features/checkout/presentation/cubit/checkout_state.dart';
import 'package:fruits_hub/generated/l10n.dart';

class AddressSection extends StatefulWidget {
  AddressSection({
    super.key,
    required this.formKey,
    required this.autovalidateValueListenable,
  });
  final GlobalKey<FormState> formKey;
  ValueListenable<AutovalidateMode> autovalidateValueListenable;

  @override
  State<AddressSection> createState() => _AddressSectionState();
}

class _AddressSectionState extends State<AddressSection>
    with AutomaticKeepAliveClientMixin {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController cityController;
  late TextEditingController floorController;
  @override
  void initState() {
    super.initState();
    OrderEntity orderEntity = context.read<OrderEntity>();
    nameController = TextEditingController(
      text: orderEntity.shippingAddress?.name,
    );
    emailController = TextEditingController(
      text: orderEntity.shippingAddress?.email,
    );
    phoneController = TextEditingController(
      text: orderEntity.shippingAddress?.phoneNumber,
    );
    addressController = TextEditingController(
      text: orderEntity.shippingAddress?.address,
    );
    cityController = TextEditingController(
      text: orderEntity.shippingAddress?.city,
    );
    floorController = TextEditingController(
      text: orderEntity.shippingAddress?.floor,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    cityController.dispose();
    floorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var locale = S.of(context);

    OrderEntity orderEntity = context.read<OrderEntity>();
    return ValueListenableBuilder(
      valueListenable: widget.autovalidateValueListenable,
      builder: (BuildContext context, value, Widget? child) => Form(
        key: widget.formKey,
        autovalidateMode: value,
        child: BlocListener<CheckoutCubit, CheckoutState>(
          listener: (context, state) {
            if (state is CheckoutAddressUpdated) {
              nameController.text = orderEntity.shippingAddress?.name ?? '';
              emailController.text = orderEntity.shippingAddress?.email ?? '';
              phoneController.text =
                  orderEntity.shippingAddress?.phoneNumber ?? '';
              addressController.text =
                  orderEntity.shippingAddress?.address ?? '';
              cityController.text = orderEntity.shippingAddress?.city ?? '';
              floorController.text = orderEntity.shippingAddress?.floor ?? '';
            }
          },
          child: SingleChildScrollView(
            child: Column(
              spacing: 8.h,
              children: [
                SizedBox(height: 24.h),
                CustomTextField(
                  controller: nameController,
                  hintText: locale.fullName,
                  onSaved: (value) {
                    if (value != null) {
                      orderEntity.shippingAddress?.name = value;
                    }
                  },
                  validator: (value) =>
                      MyValidators.displayNamevalidator(value),
                ),
                CustomTextField(
                  controller: emailController,
                  hintText: locale.email,
                  keyBoardType: TextInputType.emailAddress,
                  validator: (value) => MyValidators.emailValidator(value),
                  onSaved: (value) {
                    if (value != null) {
                      orderEntity.shippingAddress!.email = value;
                    }
                  },
                ),
                CustomTextField(
                  controller: phoneController,
                  hintText: locale.phoneNumber,
                  keyBoardType: TextInputType.phone,
                  validator: (value) => MyValidators.phoneValidator(value),
                  onSaved: (value) {
                    if (value != null) {
                      orderEntity.shippingAddress!.phoneNumber = value;
                    }
                  },
                ),
                CustomTextField(
                  controller: addressController,
                  hintText: locale.address,
                  validator: (value) =>
                      MyValidators.genericValidator(value: value),
                  onSaved: (value) {
                    if (value != null) {
                      orderEntity.shippingAddress!.address = value;
                    }
                  },
                ),
                CustomTextField(
                  controller: cityController,
                  validator: (value) =>
                      MyValidators.genericValidator(value: value),
                  hintText: locale.city,
                  onSaved: (value) {
                    if (value != null) {
                      orderEntity.shippingAddress!.city = value;
                    }
                  },
                ),
                CustomTextField(
                  controller: floorController,
                  validator: (value) =>
                      MyValidators.genericValidator(value: value),
                  hintText: locale.floor,
                  onSaved: (value) {
                    if (value != null) {
                      orderEntity.shippingAddress!.floor = value;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
