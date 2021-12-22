import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/data/models/products.dart';
import 'package:food_app/presentation/screens/home/widgets/dish_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String search = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    await getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: TextField(
              onChanged: (value) {
                setState(() async {
                  search = value;
                  await getData();
                });
              },
            )),
            Expanded(
              flex: 3,
              child: ListView.builder(
                itemBuilder: (ctx, index) => DishCard(
                    product: Product(
                        title: 'g',
                        description: 'gtgpktpgtkg',
                        id: 'rgr',
                        discount: 0,
                        price: 11,
                        category: 'food',
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/food-app-a79a5.appspot.com/o/onBoarding1.jpg?alt=media&token=64d53d28-f6a7-447a-bd0a-5bf47b86316a')),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getData() async {
    var query = await FirebaseFirestore.instance
        .collection('products')
        // .where('title', isEqualTo: 'snacks'.substring(0, 1))
        .get();
    var list = query.docs;
    print(list.length);
    print(list[0]['description']);
    // list.map((e) {
    //   print(e['title']);
    // });
  }
}
