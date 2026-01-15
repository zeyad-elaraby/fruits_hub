import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/get_user_data.dart';
import 'package:fruits_hub/core/services/service_locator.dart';
import 'package:fruits_hub/features/authentication/presentation/widgets/custom_auth_app_bar.dart';
import 'package:fruits_hub/features/cart/domain/cart_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:fruits_hub/features/checkout/presentation/widgets/checkout_cubit_bloc_consumer.dart';
import 'package:fruits_hub/features/checkout/presentation/widgets/checkout_view_body.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderEntity orderEntity;
  @override
  void initState() {
    orderEntity = OrderEntity(
      uId: getUserData().uId,
      cartEntity: widget.cartEntity,
      shippingAddress: ShippingAddressEntity(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CheckoutCubit>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: SecondaryAppBar(title: S.of(context).shipping),
        body: Provider.value(
          value: orderEntity,
          child: CheckoutCubitBlocConsumer(child: CheckoutViewBody()),
        ),
      ),
    );
  }
}
