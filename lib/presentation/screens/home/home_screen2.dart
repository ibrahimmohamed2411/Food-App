import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/data/models/products.dart';
import 'package:food_app/logic/cubit/products/products_cubit.dart';
import 'package:food_app/presentation/screens/home/widgets/dish_card.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'dart:math' as math;

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemPosition = ItemPositionsListener.create();
    final itemScrollController = ItemScrollController();

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
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
              floating: true,
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
            ),
            SliverToBoxAdapter(
              child: ScrollablePositionedList.builder(
                itemCount: 20,
                itemBuilder: (context, index) =>
                    DishCard(
                      product: Product(
                          title: 'title',
                          id: '1',
                          discount: 10,
                          price: 10,
                          imageUrl: 'imageUrl',
                          description: 'description',
                          category: 'category'),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//
// const double _kTabHeight = 46.0;
//
// class TabBarPositionedList extends StatefulWidget
//     implements PreferredSizeWidget {
//   const TabBarPositionedList(
//       {Key? key, required this.tabs, this.indicatorWeight = 2.0})
//       : super(key: key);
//
//   final List<Widget> tabs;
//
//   final Color? indicatorColor;
//
//   final double indicatorWeight;
//
//   final bool automaticIndicatorColorAdjustment;
//
//
//   /
//
//   final Decoration? indicator;
//
//   @override
//   Size get preferredSize {
//     double maxHeight = _kTabHeight;
//     for (final Widget item in tabs) {
//       if (item is PreferredSizeWidget) {
//         final double itemHeight = item.preferredSize.height;
//         maxHeight = math.max(itemHeight, maxHeight);
//       }
//     }
//     return Size.fromHeight(maxHeight + indicatorWeight);
//   }
//
//   @override
//   _TabBarPositionedListState createState() => _TabBarPositionedListState();
// }
//
// class _TabBarPositionedListState extends State<TabBarPositionedList> {
//   Decoration get _indicator {
//     if (widget.indicator != null) return widget.indicator!;
//     final TabBarTheme tabBarTheme = TabBarTheme.of(context);
//     if (tabBarTheme.indicator != null) return tabBarTheme.indicator!;
//
//     Color color = widget.indicatorColor ?? Theme
//         .of(context)
//         .indicatorColor;
//     if (widget.automaticIndicatorColorAdjustment &&
//         color.value == Material
//             .of(context)
//             ?.color
//             ?.value) color = Colors.white;
//
//     return UnderlineTabIndicator(
//       borderSide: BorderSide(
//         width: widget.indicatorWeight,
//         color: color,
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ScrollablePositionedList.builder(
//         itemCount: widget.tabs.length,
//         itemBuilder: (context, index) =>
//     );
//   }
// }
