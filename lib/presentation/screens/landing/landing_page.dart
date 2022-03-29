import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/logic/cubit/authentication/authentication_cubit.dart';
import 'package:food_app/logic/cubit/bottomNavigationBar/bottom_nav_bar_cubit.dart';
import 'package:food_app/logic/cubit/signInValidation/sign_in_validation_cubit.dart';
import 'package:food_app/presentation/bottomnavigationbar/bottom_nav_bar_screen.dart';
import 'package:food_app/presentation/screens/signIn/sign_in_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationError) {
          AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.ERROR,
            title: 'Failed',
            desc: state.message,
            btnOkOnPress: () {},
          ).show();

          context.read<SignInValidationCubit>().endSubmit();
        }
      },
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user == null) {
              return const SignInScreen();
            }

            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (ctx) => BottomNavBarCubit(),
                ),
              ],
              child: const BottomNavigationBarScreen(),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return const Text('Error');
        },
      ),
    );
  }
}
