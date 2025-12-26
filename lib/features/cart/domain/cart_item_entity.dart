import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/domain/entity/product_entity.dart';

class CartItemEntity extends Equatable {
  ProductEntity product;
  int count;
  CartItemEntity({required this.product, required this.count});

  num calculateTotalPrice() {
    return product.price * count;
  }

  num calculateTotalUnitAmount() {
    return product.unitAmount * count;
  }

  void increaseCount() {
    count++;
  }

  void decreaseCount() {
    if (count > 1) {
      count--;
    }
  }

  @override
  List<Object?> get props => [product];
}
