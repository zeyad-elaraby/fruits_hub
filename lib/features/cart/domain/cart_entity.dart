import 'package:fruits_hub/core/domain/entity/product_entity.dart';
import 'package:fruits_hub/features/cart/domain/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;
  CartEntity({required this.cartItems});

  isProductExist(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (product == cartItem.product) {
        return true;
      }
    }
    return false;
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.calculateTotalPrice();
    }
    return totalPrice;
  }

  CartItemEntity getCartItem(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (product == cartItem.product) {
        return cartItem;
      }
    }
    return CartItemEntity(product: product, quantity: 1);
  }

  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  removeCartItem(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }
}
