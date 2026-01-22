import 'dart:math';

import 'package:fruits_hub/features/checkout/data/models/order_product_model.dart';
import 'package:fruits_hub/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String orderId;
  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
    required this.orderId,
  });

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      totalPrice: entity.cartEntity.calculateTotalPrice(),
      uId: entity.uId,
      shippingAddressModel: ShippingAddressModel.fromEntity(
        entity.shippingAddress!,
      ),
      orderProducts: entity.cartEntity.cartItems
          .map((e) => OrderProductModel.fromEntity(e))
          .toList(),
      paymentMethod: entity.payWithCash == true ? "Cash" : "Paypal",
      orderId: entity.orderId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "totalPrice": totalPrice,
      "uId": uId,
      "shippingAddress": shippingAddressModel.toJson(),
      "status": "pending",
      "date": DateTime.now().toString(),
      "orderProducts": orderProducts.map((e) => e.toJson()).toList(),
      "paymentMethod": paymentMethod,
      "orderId": orderId,
    };
  }
}
