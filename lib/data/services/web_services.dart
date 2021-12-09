import 'package:cloud_firestore/cloud_firestore.dart';

class WebServices {
  Future<QuerySnapshot<Map<String, dynamic>>> fetchProducts() async {
    return await FirebaseFirestore.instance.collection('products').get();
  }
}
