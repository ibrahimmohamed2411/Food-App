import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/data/models/cart_item.dart';
import 'package:food_app/data/models/products.dart';
import 'package:food_app/data/repositories/basket_repository.dart';

part 'cart_state.dart';

extension on List<CartItem> {
  int getItem(CartItem cartItem) {
    return indexWhere((element) => element.productId == cartItem.productId);
  }
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final BasketRepository _basketRepository = BasketRepository();
  Future<void> geBasketItems() async {
    try {
      emit(Loading());
      List<CartItem> cartItems = await _basketRepository.geBasketItems();
      emit(CartLoaded(cartItems: cartItems));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  void addItem(Product product, int quantity) async {
    List<CartItem> cartItems =
        List<CartItem>.from((state as CartLoaded).cartItems);
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
      FirebaseFirestore.instance
          .collection(
              'basket/${FirebaseAuth.instance.currentUser!.uid}/basketItems')
          .doc(cartItem.productId)
          .set(cartItem.toJson());
    } else {
      cartItems[index].quantity += quantity;
      FirebaseFirestore.instance
          .collection(
              'basket/${FirebaseAuth.instance.currentUser!.uid}/basketItems')
          .doc(cartItem.productId)
          .update(
        {
          'quantity': cartItems[index].quantity,
        },
      );
    }

    emit(CartLoaded(cartItems: cartItems));
  }

  void deleteCartItem(CartItem cartItem) {
    List<CartItem> cartItems =
        List<CartItem>.from((state as CartLoaded).cartItems);
    cartItems.remove(cartItem);
    FirebaseFirestore.instance
        .collection(
            'basket/${FirebaseAuth.instance.currentUser!.uid}/basketItems')
        .doc(cartItem.productId)
        .delete();
    emit(CartLoaded(cartItems: cartItems));
  }

  void incrementItem(CartItem cartItem) {
    List<CartItem> cartItems =
        List<CartItem>.from((state as CartLoaded).cartItems);
    int index = cartItems.getItem(cartItem);
    cartItem.quantity++;
    cartItems[index] = cartItem;
    FirebaseFirestore.instance
        .collection(
            'basket/${FirebaseAuth.instance.currentUser!.uid}/basketItems')
        .doc(cartItem.productId)
        .update(
      {
        'quantity': cartItems[index].quantity,
      },
    );
    emit(CartLoaded(cartItems: cartItems));
  }

  void decrementItem(CartItem cartItem) {
    List<CartItem> cartItems =
        List<CartItem>.from((state as CartLoaded).cartItems);
    int index = cartItems.getItem(cartItem);
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
      cartItems[index] = cartItem;
      FirebaseFirestore.instance
          .collection(
              'basket/${FirebaseAuth.instance.currentUser!.uid}/basketItems')
          .doc(cartItem.productId)
          .update(
        {
          'quantity': cartItems[index].quantity,
        },
      );
      emit(CartLoaded(cartItems: cartItems));
    }
  }

  Future<void> productTransaction() async {
    try {
      final instance = FirebaseFirestore.instance;
      final batch = instance.batch();
      // basket/${FirebaseAuth.instance.currentUser!.uid}/basketItems
      List<CartItem> cartItems =
          List<CartItem>.from((state as CartLoaded).cartItems);
      final cartItemsList = [];
      double totalPrice = 0;
      for (CartItem cartItem in cartItems) {
        var cartDoc = instance
            .collection(
                'basket/${FirebaseAuth.instance.currentUser!.uid}/basketItems')
            .doc(cartItem.productId);

        batch.delete(cartDoc);
        totalPrice += cartItem.price * cartItem.quantity;
        final productMap = {};
        productMap['imageUrl'] = cartItem.imageUrl;
        productMap['price'] = cartItem.price;
        productMap['quantity'] = cartItem.quantity;
        productMap['title'] = cartItem.title;

        cartItemsList.add(productMap);
      }
      var productDoc = instance
          .collection(
              'orders/${FirebaseAuth.instance.currentUser!.uid}/personalOrders')
          .doc();
      final productMap = {
        'amount': totalPrice,
        'cartItems': cartItemsList,
        'orderDate': DateTime.now().toIso8601String(),
      };

      batch.set(productDoc, productMap);

      await batch.commit();

      emit(CartLoaded(cartItems: const []));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }
}
