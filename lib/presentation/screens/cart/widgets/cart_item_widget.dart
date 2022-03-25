import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/data/models/cart_item.dart';
import 'package:food_app/logic/cubit/cart/cart_cubit.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const CartItemWidget({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(cartItem.productId),
      direction: DismissDirection.startToEnd,
      background: const Icon(
        Icons.delete,
        color: Colors.red,
        size: 35,
      ),
      onDismissed: (direction) {
        BlocProvider.of<CartCubit>(context).deleteCartItem(cartItem);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Item Deleted successfully'),
            duration: Duration(seconds: 1),
          ),
        );
      },
      child: SizedBox(
        height: 130,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
          tileColor: Colors.white70,
          title: Text(
            cartItem.title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              cartItem.imageUrl,
              fit: BoxFit.fill,
              // height: 100,
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'EGP ${cartItem.price * cartItem.quantity}',
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<CartCubit>(context)
                          .decrementItem(cartItem);
                    },
                    child: const Text(
                      '-',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Text(
                    cartItem.quantity.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<CartCubit>(context)
                          .incrementItem(cartItem);
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
