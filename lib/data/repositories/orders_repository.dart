import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:food_app/data/models/order_item.dart';
import 'package:food_app/data/services/web_services.dart';

class OrdersRepository {
  final WebServices _webServices = WebServices();
  Future<List<OrderItem>> geOrders() async {
    QuerySnapshot snapshot = await _webServices.fetchOrders();
    List<QueryDocumentSnapshot<Object?>> list = snapshot.docs;
    return compute(parseOrders, list);
  }
}

List<OrderItem> parseOrders(List<QueryDocumentSnapshot<Object?>> json) {
  if (json.isNotEmpty) {
    return json.map((e) => OrderItem.fromJson(e)).toList().reversed.toList();
  }
  return [];
}
