import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/data/models/products.dart';
import 'package:food_app/presentation/screens/home/widgets/dish_card.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  void showResults(BuildContext context) {}

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('products')
            .where('title', isEqualTo: query.toString())
            .snapshots(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('item Not found'));
            }
            return ListView.builder(
              itemBuilder: (ctx, index) {
                DocumentSnapshot data = snapshot.data!.docs[index];
                return DishCard(
                  product: Product(
                      title: data['title'],
                      id: data['id'],
                      discount: data['discount'],
                      price: data['price'],
                      imageUrl: data['imageUrl'],
                      description: data['description'],
                      category: data['category']),
                );
              },
              itemCount: snapshot.data!.docs.length,
            );
          }
          return const Center(child: Text('Error'));
        },
      );
    }
    return const SizedBox();
  }
}
