import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/logic/cubit/cart/cart_cubit.dart';
import 'package:food_app/presentation/screens/cart/widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.cartItems.length,
          itemBuilder: (_, index) =>
              CartItemWidget(cartItem: state.cartItems[index]),
        );
      },
    );
  }
}
