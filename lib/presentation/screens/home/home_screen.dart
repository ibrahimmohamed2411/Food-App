import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/presentation/widgets/custom_card.dart';

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
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DishCard(),
                  ),
                ),
                Text("Page 2"),
                Text("Page 3"),
                Text("Page 4"),
                Text("Page 5")
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
                        Container(
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
                      ],
                    ),
                  ),
                ),
                bottom: TabBar(
                    padding: EdgeInsetsDirectional.only(start: 50),
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
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
                      children: const [
                        Text(
                          '\$9.25',
                          style: TextStyle(color: KPrimary, fontSize: 16),
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
