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
    for (int i = 0; i < length; i++) {
      if (this[i].equals(cartItem)) {
        return i;
      }
    }
    return -1;
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
      emit(Error(message: e.toString()));
    }
  }

  void addItem(Product product, int quantity) {
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
        .set(
      {
        "quantity": cartItems[index].quantity,
      },
      SetOptions(merge: true),
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
          .set(
        {
          "quantity": cartItems[index].quantity,
        },
        SetOptions(merge: true),
      );
      emit(CartLoaded(cartItems: cartItems));
    }
  }

  Future<void> clearCart() async {
    try {
      final instance = FirebaseFirestore.instance;
      final batch = instance.batch();
      var collection = instance.collection(
          'basket/${FirebaseAuth.instance.currentUser!.uid}/basketItems');
      var snapshots = await collection.get();
      for (var doc in snapshots.docs) {
        batch.delete(doc.reference);
      }
      await batch.commit();
      emit(CartLoaded(cartItems: const []));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
