import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/constants/strings.dart';
import 'package:food_app/logic/cubit/auth/auth_cubit.dart';
import 'package:food_app/presentation/routes/app_router.dart';
import 'package:food_app/presentation/screens/forget_password_screen.dart';
import 'package:food_app/presentation/screens/home_screen.dart';
import 'package:food_app/presentation/screens/onBoarding/on_boarding_screen.dart';
import 'package:food_app/presentation/screens/sign_up_screen.dart';
import 'package:food_app/presentation/screens/signin_screen.dart';

late String initialRoute;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseAuth.instance.authStateChanges().listen((user) {
  //   if (user == null) {
  //     initialRoute = signInScreen;
  //   } else {
  //     initialRoute = homeScreen;
  //   }
  // });
  runApp(FoodApp(appRouter: AppRouter()));
}

class FoodApp extends StatelessWidget {
  final AppRouter appRouter;
  const FoodApp({Key? key, required this.appRouter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: MaterialApp(
        title: 'Food App',
        theme: ThemeData(
          scaffoldBackgroundColor: KScaffoldColor,
          //primarySwatch: Colors.blue,
          primaryColor: KPrimary,
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        //onGenerateRoute: appRouter.onGenerateRoute,
        home: SignUpScreen(),
      ),
    );
  }
}

// class LandingPage extends StatelessWidget {
//   const LandingPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (BuildContext context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           final user = snapshot.data;
//           if (user == null) {
//             return const SignInScreen();
//           }
//
//           return const HomeScreen();
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const CircularProgressIndicator.adaptive();
//         }
//         return const Text('Error');
//       },
//     );
//   }
// }
