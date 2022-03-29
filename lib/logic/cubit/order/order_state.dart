part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class Loading extends OrderState {}

class Error extends OrderState {
  final String message;
  Error({required this.message});
}

class OrderLoaded extends OrderState {
  final List<OrderItem> orderItems;
  OrderLoaded({required this.orderItems});
}
