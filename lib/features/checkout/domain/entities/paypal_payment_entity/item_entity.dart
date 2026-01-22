import 'package:fruits_hub/core/helper_functions/get_currency.dart';
import 'package:fruits_hub/features/cart/domain/cart_item_entity.dart';

class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };

  factory ItemEntity.fromEntity(CartItemEntity entity) {
    return ItemEntity(
      name: entity.product.name,
      quantity: entity.quantity,
      price: entity.product.price.toString(),
      currency: getCurrency(),
    );
  }
}
