import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      height: 164.h,
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
                      right: 15.w,
                      top: 30.h,
                      left: constrains.maxWidth / 4,
                      bottom: 15.h),
                  children: [
                    Text(
                      product.title,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      product.description,
                      maxLines: 3,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.price}',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16.sp),
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
                    borderRadius: BorderRadius.circular(5.r),
                    image: DecorationImage(
                      fit: BoxFit.fill,
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
