part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class Loading extends CartState {}

class CartError extends CartState {
  final String message;
  CartError({required this.message});
}

class CartLoaded extends CartState {
  final List<CartItem> cartItems;
  CartLoaded({required this.cartItems});
}
