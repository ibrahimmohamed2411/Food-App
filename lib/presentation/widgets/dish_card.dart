import 'package:flutter/material.dart';

import 'custom_card.dart';

class DishCard extends StatelessWidget {
  const DishCard({
    Key? key,
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
                      'Pumpkin Soup',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
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
                          '\$9.25',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16),
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
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/pumpkin_soup.jpeg',
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
