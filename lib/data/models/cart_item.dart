class CartItem {
  final String productId;
  final String title;
  final int quantity;
  final num price;
  final String imageUrl;
  CartItem({
    required this.title,
    required this.price,
    required this.productId,
    required this.quantity,
    required this.imageUrl,
  });
}
