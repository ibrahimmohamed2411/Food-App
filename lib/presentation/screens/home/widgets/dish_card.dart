import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/data/models/products.dart';
import 'package:food_app/presentation/widgets/custom_card.dart';

class DishCard extends StatelessWidget {
  final Product product;
  const DishCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 216,
      child: LayoutBuilder(
        builder: (context, constrains) {
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: (constrains.maxWidth / 4) + 10),
                child: CustomCard(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  padding: EdgeInsets.only(
                      right: 15,
                      top: 30,
                      left: constrains.maxWidth / 4,
                      bottom: 15),
                  children: [
                    Text(
                      product.title,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      product.description,
                      maxLines: 3,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.price}',
                          style: const TextStyle(color: KPrimary, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: constrains.maxWidth / 2,
                  height: constrains.maxHeight * 4 / 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: NetworkImage(
                        product.imageUrl,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
