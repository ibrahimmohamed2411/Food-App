import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/data/services/fire_store_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: const Icon(Icons.list),
                foregroundColor: Colors.black,
                actions: const [
                  Icon(Icons.add_shopping_cart_rounded),
                ],
                expandedHeight: 350,
                elevation: 0.0,
                pinned: true,
                stretch: true,
                backgroundColor: Colors.white,
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
                bottom: const TabBar(
                  padding: EdgeInsetsDirectional.only(start: 50),
                  isScrollable: true,
                  labelColor: Colors.grey,
                  indicatorColor: Color(0xFFFA4A0C),
                  tabs: [
                    Tab(text: "Tab1"),
                    Tab(text: "Tab2"),
                    Tab(text: "Tab3"),
                    Tab(text: "Tab4"),
                    Tab(text: "Tab1"),
                    Tab(text: "Tab2"),
                    Tab(text: "Tab3"),
                    Tab(text: "Tab4"),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      height: 500,
                      child: TabBarView(
                        children: [
                          StreamBuilder(
                            builder: (ctx,
                                AsyncSnapshot<
                                        QuerySnapshot<Map<String, dynamic>>>
                                    snap) {
                              if (snap.hasError) {
                                return Text('Error');
                              }
                              if (snap.hasData) {
                                return ListView.builder(
                                  //shrinkWrap: true,
                                  itemBuilder: (ctx, index) =>
                                      Text(snap.data!.docs[index]['id']),
                                  itemCount: snap.data!.docs.length,
                                );
                              }
                              return CircularProgressIndicator.adaptive();
                            },
                            stream: FirebaseFirestore.instance
                                .collection('products')
                                .snapshots(),
                          ),
                          Center(child: Text('2')),
                          Center(child: Text('3')),
                          Center(child: Text('4')),
                          Center(child: Text('5')),
                          Center(child: Text('6')),
                          Center(child: Text('7')),
                          Center(child: Text('8')),
                        ],
// controller: controller,
                      ),
                    ),
                    // SizedBox(
                    //   height: 500,
                    // ),
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
