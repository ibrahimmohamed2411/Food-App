part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class Loading extends CartState {}

class Error extends CartState {
  final String message;
  Error({required this.message});
}

class CartLoaded extends CartState {
  final List<CartItem> cartItems;
  CartLoaded({required this.cartItems});
}
