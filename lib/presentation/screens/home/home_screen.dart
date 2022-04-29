import 'package:flutter/material.dart';
import 'package:food_app/data/models/products.dart';
import 'package:food_app/presentation/screens/home/search.dart';
import 'package:food_app/presentation/screens/home/widgets/dish_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: DefaultTabController(
        length: 5,
        child: SafeArea(
          child: NestedScrollView(
            body: TabBarView(
              children: [
                ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DishCard(
                      product: Product(
                        id: 'fff',
                        title: 'Parmesan Fries',
                        description:
                            'Crispy fries, parmesan cheese slices and herbs butter, served with garlic mayonnaise sauce.',
                        price: 10,
                        category: 'food',
                        discount: 0,
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/food-app-a79a5.appspot.com/o/pumpkin_soup.jpeg?alt=media&token=a43d8a0b-95ff-4d8a-9a57-4ba4943b33c6',
                      ),
                    ),
                  ),
                  itemCount: 5,
                ),
                const Text("Page 2"),
                const Text("Page 3"),
                const Text("Page 4"),
                const Text("Page 5"),
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
                expandedHeight: 350,
                elevation: 0.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          'Delicious\nfood for you',
                          style: TextStyle(
                            fontSize: 34,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            showSearch(context: context, delegate: Search());
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 30),
                            height: 60,
                            padding: const EdgeInsets.only(left: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey[300],
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Search',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottom: TabBar(
                  padding: const EdgeInsetsDirectional.only(start: 50),
                  isScrollable: true,
                  labelColor: Colors.grey,
                  indicatorColor: Color(0xFFFA4A0C),
                  tabs: [
                    Tab(
                      child: Text(
                        "All",
                        style: textTheme.subtitle2,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Categories",
                        style: textTheme.subtitle2,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Upcoming",
                        style: textTheme.subtitle2,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Categories",
                        style: textTheme.subtitle2,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Upcoming",
                        style: textTheme.subtitle2,
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
