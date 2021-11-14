import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _TestScreenState extends State<TestScreen> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

// [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
// turn can be placed in a [Scaffold.body].
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: _pinned,
              snap: _snap,
              floating: _floating,
              expandedHeight: 240.0,
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
                  Tab(text: "Tab5"),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
                child: Center(
                  child: Text('Scroll to see the SliverAppBar in effect.'),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: index.isOdd ? Colors.white : Colors.black12,
                    height: 120.0,
                    child: Center(
                      child: Text('$index', textScaleFactor: 5),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: OverflowBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('pinned'),
                    Switch(
                      onChanged: (bool val) {
                        setState(() {
                          _pinned = val;
                        });
                      },
                      value: _pinned,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('snap'),
                    Switch(
                      onChanged: (bool val) {
                        setState(() {
                          _snap = val;
                          // Snapping only applies when the app bar is floating.
                          _floating = _floating || _snap;
                        });
                      },
                      value: _snap,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('floating'),
                    Switch(
                      onChanged: (bool val) {
                        setState(() {
                          _floating = val;
                          _snap = _snap && _floating;
                        });
                      },
                      value: _floating,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
