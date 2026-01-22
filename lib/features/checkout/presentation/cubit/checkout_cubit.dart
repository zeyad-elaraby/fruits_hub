import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/domain/repository/base_orders_repository.dart';
import 'package:fruits_hub/features/checkout/presentation/cubit/checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.baseOrdersRepository) : super(CheckoutInitial());
  final BaseOrdersRepository baseOrdersRepository;

  Future<void> addOrder({required OrderEntity orderEntity}) async {
    emit(CheckoutLoading());
    final result = await baseOrdersRepository.addOrder(orderEntity);
    result.fold(
      (failure) {
        emit(CheckoutError(failure.message));
      },
      (_) {
        emit(CheckoutSuccess());
      },
    );
  }

  void triggerAddressUpdate() {
    emit(CheckoutAddressUpdated());
  }
}
