import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/helper_functions/route_manager/app_routes.dart';
import 'package:fruits_hub/core/utils/app_keys.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_snack_bar.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entities/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:fruits_hub/features/checkout/presentation/widgets/checkout_steps.dart';
import 'package:fruits_hub/features/checkout/presentation/widgets/checkout_steps_page_view.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController _pageController;
  ValueNotifier<AutovalidateMode> autovalidateModeNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );
  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        currentPageIndex = _pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    autovalidateModeNotifier.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return Column(
      children: [
        SizedBox(height: 16.h),
        CheckoutSteps(
          currentPageIndex: currentPageIndex,
          pageController: _pageController,
          onTap: (index) {
            OrderEntity orderEntity = context.read<OrderEntity>();
            switch (currentPageIndex) {
              case 0:
                if (index == 1) {
                  shippingSectionValidation(context);
                } else if (index == 2) {
                  bool? validated = formKey.currentState?.validate() ?? false;

                  if (orderEntity.payWithCash != null && validated == true) {
                    formKey.currentState?.save();
                    animateToPage(2);
                  } else {
                    if (orderEntity.payWithCash == null) {
                      customSnackBar(
                        context: context,
                        title: "تنبيه",
                        message: "يرجى تحديد طريقة الدفع",
                        contentType: ContentType.warning,
                      );
                    } else {
                      animateToPage(1);
                      customSnackBar(
                        context: context,
                        title: "تنبيه",
                        message: "يرجى إكمال بيانات التوصيل",
                        contentType: ContentType.warning,
                      );
                    }
                  }
                }
                break;
              case 1:
                if (index == 0) {
                  animateToPage(0);
                } else {
                  _addressSectionValidate();
                }
                break;
              default:
                animateToPage(index);
            }
          },
        ),
        Expanded(
          child: CheckoutStepsPageView(
            pageController: _pageController,
            autovalidateValueListenable: autovalidateModeNotifier,
            formKey: formKey,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.06,
          ),
          child: CustomElevatedButton(
            onPressed: () {
              if (_pageController.page == 0) {
                shippingSectionValidation(context);
              } else if (_pageController.page == 1) {
                _addressSectionValidate();
              } else {
                _processPayment(context);
              }
            },
            title: getCheckoutButtonTitle(currentPageIndex),
          ),
        ),
        SizedBox(height: 32.h),
      ],
    );
  }

  animateToPage(int targetPageIndex) {
    _pageController.animateToPage(
      targetPageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _addressSectionValidate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      animateToPage(2);
    } else {
      autovalidateModeNotifier.value = AutovalidateMode.always;
      customSnackBar(
        context: context,
        title: "تنبيه",
        message: "يرجى ملئ بيانات التوصيل",
        contentType: ContentType.warning,
      );
    }
  }

  void shippingSectionValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      animateToPage(1);
    } else {
      customSnackBar(
        context: context,
        title: "تنبيه",
        message: "يرجى تحديد طريقة الدفع",
        contentType: ContentType.warning,
      );
    }
  }

  getCheckoutButtonTitle(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return S.current.next;
      case 1:
        return S.current.next;
      case 2:
        return S.current.paayWithPaypal;
      default:
        return S.current.next;
    }
  }

  void _processPayment(BuildContext context) {
    OrderEntity orderEntity = context.read<OrderEntity>();
    var checkoutCubit = context.read<CheckoutCubit>();
    PaypalPaymentEntity paypalPaymentEntity = PaypalPaymentEntity.fromEntity(
      orderEntity,
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: kPaypalClientId,
          secretKey: kPaypalSecretKey,
          transactions: [paypalPaymentEntity.toJson()],

          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            print("onSuccess: $params");
            checkoutCubit.addOrder(orderEntity: orderEntity);
            Navigator.pushNamed(context, AppRoutes.mainView);
          },
          onError: (error) {
            print("onError: $error");

            Navigator.pop(context);
            customSnackBar(
              context: context,
              title: "error",
              message: "Payment failed",
              contentType: ContentType.failure,
            );
          },
          onCancel: () {
            print('cancelled:');
            customSnackBar(
              context: context,
              title: "cancelled",
              message: "Payment cancelled",
              contentType: ContentType.warning,
            );
          },
        ),
      ),
    );
  }
}
