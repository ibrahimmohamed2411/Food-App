import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/data/models/cart_item.dart';

class OrderItem {
  final DateTime orderDate;
  final double amount;
  List<CartItem> cartItems;
  OrderItem({
    required this.cartItems,
    required this.amount,
    required this.orderDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderDate': orderDate.toIso8601String(),
      'amount': amount,
      'cartItems': cartItems.map((cartItem) => cartItem.toJson()).toList(),
    };
  }

  factory OrderItem.fromJson(QueryDocumentSnapshot<Object?> json) => OrderItem(
        orderDate: DateTime.parse(json['orderDate']),
        amount: json['amount'] as double,
        cartItems: List<CartItem>.from(
          json["cartItems"].map(
            (x) => CartItem.fromJson(x),
          ),
        ),
      );
}
