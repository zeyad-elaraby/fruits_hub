import 'package:fruits_hub/features/cart/domain/cart_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entities/shipping_address_entity.dart';

class OrderEntity {
  final String uId;
  final String orderId;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity? shippingAddress;

  OrderEntity({
    required this.uId,
    required this.cartEntity,
    required this.shippingAddress,
    this.payWithCash, required this.orderId,
  });
  int calculateShippingCost() {
    if (payWithCash!) {
      return 30;
    } else {
      return 0;
    }
  }

  int calculateShippingDiscount() {
    return 0;
  }

  caluculateTotalPriceAfterDiscountAndShipping() {
    return cartEntity.calculateTotalPrice() +
        calculateShippingCost() -
        calculateShippingDiscount();
  }
}
