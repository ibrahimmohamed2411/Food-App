import 'package:bloc/bloc.dart';
import 'package:food_app/data/models/cart_item.dart';
import 'package:food_app/data/models/products.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(cartItems: []));
  void addItem(Product product, int quantity) {
    List<CartItem> cartItems = state.cartItems;
    cartItems.add(
      CartItem(
        imageUrl: product.imageUrl,
        title: product.title,
        price: product.price,
        productId: product.id,
        quantity: quantity,
      ),
    );
    emit(CartState(cartItems: cartItems));
  }

  void incrementItem(CartItem cartItem) {
    cartItem.quantity + 1;
    emit(CartState(cartItems: state.cartItems));
  }
}
