import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/logic/cubit/auth/auth_cubit.dart';
import 'package:food_app/logic/cubit/signIn/sign_in_cubit.dart';
import 'package:food_app/logic/cubit/theme/theme_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Screen'),
            TextButton(
              onPressed: () async {
                await BlocProvider.of<SignInCubit>(context).signOut();
              },
              child: const Text('SignOut'),
            ),
            BlocBuilder<ThemeCubit, bool>(
              builder: (ctx, state) => Switch(
                value: state,
                onChanged: (val) {
                  BlocProvider.of<ThemeCubit>(context).toggleTheme(val);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
