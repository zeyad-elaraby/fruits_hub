import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/cart/domain/cart_item_entity.dart';
import 'package:fruits_hub/features/cart/presentation/cubits/cart_item_cubit/cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

  void updateCartItem(CartItemEntity cartItemEntity) {
    emit(CartItemUpdated(cartItemEntity: cartItemEntity));
  }
}
