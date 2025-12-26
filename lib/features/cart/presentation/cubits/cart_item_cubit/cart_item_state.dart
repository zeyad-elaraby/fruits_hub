import 'package:fruits_hub/features/cart/domain/cart_item_entity.dart';

sealed class CartItemState {}

final class CartItemInitial extends CartItemState {}

final class CartItemUpdated extends CartItemState {
  CartItemEntity cartItemEntity;
  CartItemUpdated({required this.cartItemEntity});
}
