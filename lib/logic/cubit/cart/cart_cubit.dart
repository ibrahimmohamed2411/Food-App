import 'package:bloc/bloc.dart';
import 'package:food_app/data/models/cart_item.dart';
import 'package:food_app/data/models/products.dart';

part 'cart_state.dart';

extension on List<CartItem> {
  int getItem(CartItem cartItem) {
    for (int i = 0; i < length; i++) {
      if (this[i].equals(cartItem)) {
        return i;
      }
    }
    return -1;
  }
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(cartItems: []));

  void addItem(Product product, int quantity) {
    List<CartItem> cartItems = state.cartItems;
    CartItem cartItem = CartItem(
      imageUrl: product.imageUrl,
      title: product.title,
      price: product.price,
      productId: product.id,
      quantity: quantity,
    );
    int index = cartItems.getItem(cartItem);
    if (index == -1) {
      cartItems.add(cartItem);
    } else {
      cartItems[index].quantity += quantity;
    }

    emit(CartState(cartItems: cartItems));
  }

  void deleteCartItem(CartItem cartItem) {
    List<CartItem> l = List<CartItem>.from(state.cartItems);
    l.remove(cartItem);
    emit(CartState(cartItems: l));
  }

  void incrementItem(CartItem cartItem) {
    List<CartItem> l = List<CartItem>.from(state.cartItems);
    int index = l.getItem(cartItem);
    cartItem.quantity++;
    l[index] = cartItem;
    emit(CartState(cartItems: l));
  }

  void decrementItem(CartItem cartItem) {
    List<CartItem> l = List<CartItem>.from(state.cartItems);
    int index = l.getItem(cartItem);
    cartItem.quantity--;
    l[index] = cartItem;
    emit(CartState(cartItems: l));
  }
}
