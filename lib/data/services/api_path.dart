class ApiPath {
  static String user(String userId) => 'users/$userId';

  static String discount(String discountId) => 'discounts/$discountId';

  static String userFavourites(String userId) => 'favourites/$userId';

  static String userOrders(String userId) => 'orders/$userId';
}
