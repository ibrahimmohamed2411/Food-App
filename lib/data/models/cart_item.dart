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
}
