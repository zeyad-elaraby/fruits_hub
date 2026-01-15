import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/features/checkout/presentation/widgets/address_section.dart';
import 'package:fruits_hub/features/checkout/presentation/widgets/payment_section.dart';
import 'package:fruits_hub/features/checkout/presentation/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  CheckoutStepsPageView({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.autovalidateValueListenable,
  });

  final PageController pageController;

  final GlobalKey<FormState> formKey;
  ValueListenable<AutovalidateMode> autovalidateValueListenable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: PageView.builder(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: getCheckoutSections().length,
        itemBuilder: (context, index) => getCheckoutSections()[index],
      ),
    );
  }

  getCheckoutSections() {
    return [
      ShippingSection(),
      AddressSection(
        formKey: formKey,
        autovalidateValueListenable: autovalidateValueListenable,
      ),
      PaymentSection(),
    ];
  }
}
