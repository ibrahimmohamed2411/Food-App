import 'package:cloud_firestore/cloud_firestore.dart';

class Products {
  List<Product> foodProducts = [];
  List<Product> drinkProducts = [];
  List<Product> snackProducts = [];
  List<Product> sauceProducts = [];

  Products.fromJson(List<QueryDocumentSnapshot<Object?>> json) {
    for (var product in json) {

      if (product['category'] == 'food') {
        foodProducts.add(Product.fromJson(product));
      } else if (product['category'] == 'drinks') {
        drinkProducts.add(Product.fromJson(product));
      } else if (product['category'] == 'snacks') {
        snackProducts.add(Product.fromJson(product));
      } else {
        sauceProducts.add(Product.fromJson(product));
      }
    }
  }
}

class Product {
  String id;
  String title;
  String description;
  num price;
  String imageUrl;
  num discount;
  String category;
  // bool? isFavourite;
  Product({
    required this.title,
    required this.id,
    required this.discount,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.category,
    // this.isFavourite,
  });
  factory Product.fromJson(QueryDocumentSnapshot<Object?> json) => Product(
        title: json['title'] ?? '',
        id: json['id'] ?? '',
        discount: json['discount'] ?? '',
        price: json['price'] ?? '',
        imageUrl: json['imageUrl'] ?? '',
        description: json['description'] ?? '',
        category: json['category'] ?? '',
      );
}
