import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/logic/cubit/bottomNavigationBar/bottom_nav_bar_cubit.dart';

import '../routes/app_router.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Bottom nav screen build');

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRouter.orderScreen);
              },
              child: const Text('Orders'),
            ),
          ],
        ),
      ),
      body: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (ctx, state) => Scaffold(
          body: IndexedStack(
            children: BlocProvider.of<BottomNavBarCubit>(context).screens,
            index:
                BlocProvider.of<BottomNavBarCubit>(context).state.currentIndex,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentIndex,
            onTap:
                BlocProvider.of<BottomNavBarCubit>(context).changeCurrentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.red,
            selectedItemColor: Colors.blue,
            backgroundColor: Colors.deepOrange,
            items: BlocProvider.of<BottomNavBarCubit>(context)
                .bottomNavigationBarItems,
          ),
        ),
      ),
    );
  }
}
