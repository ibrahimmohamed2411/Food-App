import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:food_app/data/models/products.dart';
import 'package:food_app/data/services/web_services.dart';

class ProductsRepository {
  final WebServices _webServices = WebServices();
  Future<Products> geProducts() async {
    QuerySnapshot snapshot = await _webServices.fetchProducts();
    List<QueryDocumentSnapshot<Object?>> list = snapshot.docs;
    return compute(parseProducts, list);
  }
}

Products parseProducts(List<QueryDocumentSnapshot<Object?>> json) {
  return Products.fromJson(json);
}
