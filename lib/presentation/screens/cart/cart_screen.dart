import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/presentation/screens/cart/widgets/cart_item_widget.dart';
import 'package:food_app/presentation/screens/cart/widgets/empty_cart_widget.dart';

import '../../../logic/cubit/cart/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          if (state.cartItems.isNotEmpty) {
            return Stack(
              children: [
                ListView.builder(
                  itemCount: state.cartItems.length,
                  itemBuilder: (_, index) => CartItemWidget(
                    cartItem: state.cartItems[index],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 120,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.deepOrange,
                    ),
                    onPressed: () {
                      // BlocProvider.of<OrderCubit>(context)
                      //     .addOrder(state.cartItems);
                      BlocProvider.of<CartCubit>(context).productTransaction();
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Order Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return const EmptyCartWidget();
        } else if (state is CartError) {
          return const Center(child: Text('Error'));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
