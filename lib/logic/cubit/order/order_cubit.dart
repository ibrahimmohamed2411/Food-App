import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/data/models/order_item.dart';
import 'package:food_app/data/repositories/orders_repository.dart';
import 'package:meta/meta.dart';

import '../../../data/models/cart_item.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrdersRepository _ordersRepository = OrdersRepository();
  OrderCubit() : super(OrderInitial());
  Future<void> addOrder(List<CartItem> cartItems) async {
    double amount = 0;
    for (CartItem cartItem in cartItems) {
      amount += cartItem.price * cartItem.quantity;
    }
    OrderItem orderItem = OrderItem(
      amount: amount,
      cartItems: cartItems,
      orderDate: DateTime.now(),
    );
    await FirebaseFirestore.instance
        .collection(
            'orders/${FirebaseAuth.instance.currentUser!.uid}/personalOrders')
        .add(orderItem.toJson());
    final updatedList = List<OrderItem>.from((state as OrderLoaded).orderItems)
      ..insert(0, orderItem);
    emit(OrderLoaded(orderItems: updatedList));
  }

  Future<void> getOrders() async {
    try {
      emit(Loading());
      List<OrderItem> orderItems = await _ordersRepository.geOrders();
      emit(OrderLoaded(orderItems: orderItems));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
