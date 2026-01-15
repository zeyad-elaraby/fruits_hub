sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutSuccess extends CheckoutState {}

final class CheckoutError extends CheckoutState {
  final String errorMessage;
  CheckoutError(this.errorMessage);
}

final class CheckoutAddressUpdated extends CheckoutState {}
