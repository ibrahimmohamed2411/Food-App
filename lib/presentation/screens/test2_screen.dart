import 'package:flutter/material.dart';

class AppView extends StatelessWidget {
  final double _minValue = 8.0;

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
                    itemBuilder: (context, index) => Container(
                          color: index.isOdd ? Colors.white : Colors.black12,
                          height: 120.0,
                          child: Center(
                            child: Text('$index', textScaleFactor: 5),
                          ),
                        )),
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
                            color: Colors.grey[100],
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
