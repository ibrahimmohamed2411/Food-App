class Product {
  String id;
  String title;
  String description;
  double price;
  String imageUrl;
  double discount;
  bool? isFavourite;
  Product({
    required this.title,
    required this.id,
    required this.discount,
    required this.price,
    required this.imageUrl,
    required this.description,
    this.isFavourite,
  });
}
