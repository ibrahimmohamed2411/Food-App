import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WebServices {
  Future<QuerySnapshot<Map<String, dynamic>>> fetchProducts() async {
    return await FirebaseFirestore.instance.collection('products').get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchOrders() async {
    return await FirebaseFirestore.instance
        .collection(
            'orders/${FirebaseAuth.instance.currentUser!.uid}/personalOrders')
        .orderBy('orderDate')
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchBasketItems() async {
    return await FirebaseFirestore.instance
        .collection(
            'basket/${FirebaseAuth.instance.currentUser!.uid}/basketItems')
        .get();
  }
}
