import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:food_app/data/models/cart_item.dart';
import 'package:food_app/data/services/web_services.dart';

class BasketRepository {
  final WebServices _webServices = WebServices();
  Future<List<CartItem>> geBasketItems() async {
    QuerySnapshot snapshot = await _webServices.fetchBasketItems();
    List<QueryDocumentSnapshot<Object?>> list = snapshot.docs;
    return compute(parseOrders, list);
  }
}

List<CartItem> parseOrders(List<QueryDocumentSnapshot<Object?>> json) {
  if (json.isNotEmpty) {
    return json
        .map((cartItem) =>
            CartItem.fromQueryDocumentSnapshot(cartItem.id, cartItem))
        .toList();
  }
  return [];
}
