import 'package:fruits_hub/features/cart/domain/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final double price;
  final int count;
  OrderProductModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.count,
  });
  factory OrderProductModel.fromEntity(CartItemEntity entity) {
    return OrderProductModel(
      name: entity.product.name,
      code: entity.product.code,
      imageUrl: entity.product.imageUrl!,
      price: entity.product.price.toDouble(),
      count: entity.quantity,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "code": code, 
      "imageUrl": imageUrl,
      "price": price,
      "count": count,
    };
  }
}
