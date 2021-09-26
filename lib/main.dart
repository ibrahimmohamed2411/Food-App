import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/logic/cubit/auth/auth_cubit.dart';
import 'package:food_app/logic/cubit/signIn/sign_in_cubit.dart';
import 'package:food_app/logic/cubit/theme/theme_cubit.dart';
import 'package:food_app/presentation/routes/app_router.dart';
import 'package:food_app/presentation/screens/signIn/sign_in_screen.dart';

import 'constants/original_screen_dimensions.dart';
import 'data/repositories/authentication_repository.dart';
import 'logic/cubit/signUp/sign_up_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    FoodApp(appRouter: AppRouter()),
  );
}

class FoodApp extends StatelessWidget {
  final AppRouter appRouter;
  const FoodApp({Key? key, required this.appRouter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (BuildContext context) => AuthCubit(),
        // ),
        BlocProvider(
          create: (BuildContext context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              SignInCubit(AuthenticationRepository()),
        ),
        BlocProvider(
          create: (BuildContext context) => SignUpCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (ctx, state) => MaterialApp(
          title: 'Food App',
          theme: ThemeData(
            //primarySwatch: Colors.blue,
            primaryColor: KPrimary,
            scaffoldBackgroundColor: KScaffoldColor,
            textTheme: const TextTheme(
              headline1: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          darkTheme: ThemeData.dark(),
          themeMode: state ? ThemeMode.dark : ThemeMode.light,
          onGenerateRoute: appRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
