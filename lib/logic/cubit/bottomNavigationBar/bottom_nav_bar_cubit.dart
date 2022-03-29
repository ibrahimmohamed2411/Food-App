import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/presentation/screens/cart/cart_screen.dart';
import 'package:food_app/presentation/screens/home/home_screen.dart';
import 'package:food_app/presentation/screens/profile/profile_screen.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  List<Widget> screens = const [
    HomeScreen(),
    CartScreen(),
    Center(child: Text('Fav')),
    ProfileScreen(),
  ];
  List<BottomNavigationBarItem> bottomNavigationBarItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
  ];

  BottomNavBarCubit() : super(BottomNavBarState(0));

  void changeCurrentIndex(int index) {
    emit(BottomNavBarState(index));
  }
}
