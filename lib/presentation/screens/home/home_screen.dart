import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/logic/cubit/products/products_cubit.dart';
import 'package:food_app/presentation/screens/home/widgets/dish_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: SafeArea(
          child: NestedScrollView(
            body: TabBarView(
              children: [
                BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (ctx, state) {
                  if (state is ProductsLoaded) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ListView.builder(
                        itemBuilder: (context, index) => DishCard(
                          product: state.products.foodProducts[index],
                        ),
                        itemCount: state.products.foodProducts.length,
                      ),
                    );
                  }
                  if (state is Error) {
                    return const Text('Error');
                  }
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }),
                BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (ctx, state) {
                  if (state is ProductsLoaded) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: ListView.builder(
                        itemBuilder: (context, index) => DishCard(
                          product: state.products.drinkProducts[index],
                        ),
                        itemCount: state.products.drinkProducts.length,
                      ),
                    );
                  }
                  if (state is Error) {
                    return const Text('Error');
                  }
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }),
                BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (ctx, state) {
                  if (state is ProductsLoaded) {
                    return ListView.builder(
                      itemBuilder: (context, index) => DishCard(
                        product: state.products.snackProducts[index],
                      ),
                      itemCount: state.products.snackProducts.length,
                    );
                  }
                  if (state is Error) {
                    return const Text('Error');
                  }
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }),
                BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (ctx, state) {
                  if (state is ProductsLoaded) {
                    return ListView.builder(
                      itemBuilder: (context, index) => DishCard(
                        product: state.products.sauceProducts[index],
                      ),
                      itemCount: state.products.sauceProducts.length,
                    );
                  }
                  if (state is Error) {
                    return const Text('Error');
                  }
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }),
              ],
            ),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => [
              SliverAppBar(
                backgroundColor: Colors.grey[100],
                leading: const Icon(Icons.list),
                foregroundColor: Colors.black,
                actions: const [
                  Icon(Icons.add_shopping_cart_rounded),
                ],
                expandedHeight: 350.h,
                elevation: 0.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Text(
                          'Delicious\nfood for you',
                          style: TextStyle(
                            fontSize: 34.sp,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          height: 60.h,
                          padding: const EdgeInsets.only(left: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[100],
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              const Text(
                                'Search',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottom: TabBar(
                  padding: const EdgeInsetsDirectional.only(start: 50),
                  isScrollable: true,
                  labelColor: const Color(0xFFFA4A0C),
                  indicatorColor: const Color(0xFFFA4A0C),
                  unselectedLabelColor: textTheme.headline3!.color,
                  tabs: [
                    Tab(
                      child: Text(
                        "Foods",
                        style: textTheme.headline5,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Drinks",
                        style: textTheme.headline5,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Snacks",
                        style: textTheme.headline5,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Sauce",
                        style: textTheme.headline5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
