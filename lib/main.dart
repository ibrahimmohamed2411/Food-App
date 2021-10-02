import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/logic/cubit/authentication/authentication_cubit.dart';
import 'package:food_app/logic/cubit/forgotPassword/forgot_password_cubit.dart';
import 'package:food_app/logic/cubit/signIn/sign_in_cubit.dart';
import 'package:food_app/logic/cubit/theme/theme_cubit.dart';
import 'package:food_app/logic/debug/app_bloc_observer.dart';
import 'package:food_app/presentation/routes/app_router.dart';

import 'logic/cubit/signUp/sign_up_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = AppBlocObserver();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => FoodApp(appRouter: AppRouter()),
  ));
}

class FoodApp extends StatelessWidget {
  final AppRouter appRouter;

  const FoodApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AuthenticationCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => SignInCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => ForgotPasswordCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (ctx, state) => ScreenUtilInit(
            designSize: const Size(432.0, 816.0),
            builder: () {
              return MaterialApp(
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
              );
            }),
      ),
    );
  }
}
