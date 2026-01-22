import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/domain/entity/product_entity.dart';

class CartItemEntity extends Equatable {
  ProductEntity product;
  int quantity;
  CartItemEntity({required this.product, required this.quantity});

  num calculateTotalPrice() {
    return product.price * quantity;
  }

  num calculateTotalUnitAmount() {
    return product.unitAmount * quantity;
  }

  void increaseQuantity() {
    quantity++;
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  @override
  List<Object?> get props => [product];
}
