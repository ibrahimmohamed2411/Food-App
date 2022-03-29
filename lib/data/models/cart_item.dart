import 'package:cloud_firestore/cloud_firestore.dart';

class CartItem {
  final String productId;
  final String title;
  int quantity;
  final num price;
  final String imageUrl;
  CartItem({
    required this.title,
    required this.price,
    required this.productId,
    required this.quantity,
    required this.imageUrl,
  });
  bool equals(CartItem cartItem) {
    if (productId == cartItem.productId) {
      return true;
    }
    return false;
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'quantity': quantity,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  factory CartItem.fromQueryDocumentSnapshot(
      QueryDocumentSnapshot<Object?> json) {
    return CartItem(
      productId: json['productId'] as String,
      title: json['title'] as String,
      quantity: json['quantity'] as int,
      price: json['price'] as num,
      imageUrl: json['imageUrl'] as String,
    );
  }
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'] as String,
      title: json['title'] as String,
      quantity: json['quantity'] as int,
      price: json['price'] as num,
      imageUrl: json['imageUrl'] as String,
    );
  }
}
