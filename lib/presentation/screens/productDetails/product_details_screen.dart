import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/data/models/products.dart';
import 'package:food_app/logic/cubit/basket/basket_item_cubit.dart';
import 'package:food_app/presentation/widgets/custom_card.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(product),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCard(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      padding: const EdgeInsets.all(10),
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          product.title,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          product.description,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[800],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocBuilder<BasketItemCubit, BasketItemState>(
                              builder: (context, state) {
                                return Text(
                                  'EGP ${product.price * state.itemCount}',
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[50],
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xffECEDF1),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      BlocProvider.of<BasketItemCubit>(context)
                                          .decrement();
                                    },
                                    child: const Text(
                                      '-',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  BlocBuilder<BasketItemCubit, BasketItemState>(
                                    builder: (context, state) {
                                      return Text(
                                        state.itemCount.toString(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      );
                                    },
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      BlocProvider.of<BasketItemCubit>(context)
                                          .increment();
                                    },
                                    child: const Text(
                                      '+',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomCard(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.messenger_outline),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Any special requests?',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Add note',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ),
                          ],
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Colors.deepOrange,
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              children: [
                                const Text(
                                  'Add to basket',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                BlocBuilder<BasketItemCubit, BasketItemState>(
                                  builder: (context, state) {
                                    return Text(
                                      'EGP ${product.price * state.itemCount}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildSliverAppBar(Product product) {
  return SliverAppBar(
    expandedHeight: 400,
    pinned: true,
    stretch: true,
    backgroundColor: Colors.deepOrange,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      // title: Text(
      //   product.title,
      //   style: const TextStyle(
      //     color: Colors.white,
      //   ),
      // ),
      background: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
    ),
  );
}
