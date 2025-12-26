import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/domain/entity/product_entity.dart';
import 'package:fruits_hub/features/cart/domain/cart_entity.dart';
import 'package:fruits_hub/features/cart/domain/cart_item_entity.dart';
import 'package:fruits_hub/features/cart/presentation/cubits/cart_cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity(cartItems: []);
  void addProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isProductExist(productEntity);
    CartItemEntity cartItemEntity = cartEntity.getCartItem(productEntity);
    if (isProductExist) {
      //increase count
      cartItemEntity.increaseCount();
    } else {
      //add new product

      cartEntity.addCartItem(cartItemEntity);
    }
    emit(CartItemAdded());
  }

  removeCartItem(CartItemEntity cartItem) {
    cartEntity.removeCartItem(cartItem);
    emit(CartItemRemoved());
  }

  // increaseCartItemCount(CartItemEntity cartItem) {
  //   cartItem.increaseCount();
  //   emit(CartItemChanged());
  // }

  // decreaseCartItemCount(CartItemEntity cartItem) {
  //   if (cartItem.count == 1) {
  //     cartEntity.removeCartItem(cartItem);
  //   } else {
  //     cartItem.decreaseCount();
  //   }
  //   emit(CartItemChanged());
  // }
}
