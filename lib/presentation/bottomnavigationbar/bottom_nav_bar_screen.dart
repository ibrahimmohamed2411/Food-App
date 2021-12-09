import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/logic/cubit/bottomNavigationBar/bottom_nav_bar_cubit.dart';
import 'package:food_app/presentation/screens/home/home_screen.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Bottom nav screen build');
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (ctx, state) => Scaffold(
        body: BlocProvider.of<BottomNavBarCubit>(context)
            .screens[state.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: state.currentIndex,
          onTap: BlocProvider.of<BottomNavBarCubit>(context).changeCurrentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.red,
          selectedItemColor: Colors.blue,
          backgroundColor: Colors.deepOrange,
          items: BlocProvider.of<BottomNavBarCubit>(context)
              .bottomNavigationBarItems,
        ),
      ),
    );
  }
}
