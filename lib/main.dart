import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/pallete.dart';
import 'package:food_app/logic/cubit/authentication/authentication_cubit.dart';
import 'package:food_app/logic/cubit/forgotPassword/forgot_password_cubit.dart';
import 'package:food_app/logic/cubit/theme/theme_cubit.dart';
import 'package:food_app/logic/debug/app_bloc_observer.dart';
import 'package:food_app/presentation/routes/app_router.dart';

import 'logic/cubit/cart/cart_cubit.dart';
import 'logic/cubit/signInValidation/sign_in_validation_cubit.dart';
import 'logic/cubit/signUpValidation/sign_up_validation_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(() {}, blocObserver: AppBlocObserver());
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
        BlocProvider(
          create: (BuildContext context) => AuthenticationCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => SignInValidationCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => SignUpValidationCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => ForgotPasswordCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => CartCubit()..geBasketItems(),
          lazy: false,
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
                primaryColor: Palette.primary,
                scaffoldBackgroundColor: Palette.scaffoldColor,
                textTheme: TextTheme(
                  headline1: TextStyle(
                    fontSize: 36.sp,
                    color: const Color(0XFF3D454F),
                    fontWeight: FontWeight.w800,
                  ),
                  headline2: TextStyle(
                    fontSize: 22.sp,
                    color: const Color(0XFF3D454F),
                    fontWeight: FontWeight.w600,
                  ),
                  headline3: TextStyle(
                    fontSize: 20.sp,
                    color: const Color(0XFF3D454F),
                    fontWeight: FontWeight.w700,
                  ),
                  headline4: TextStyle(
                    fontSize: 18.sp,
                    color: const Color(0XFF3D454F),
                  ),
                  headline5: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0XFF3D454F),
                  ),
                  subtitle1: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                      wordSpacing: 2,
                      overflow: TextOverflow.ellipsis,
                      height: 1.4),
                ),
              ),
              darkTheme: ThemeData.dark(),
              themeMode: state ? ThemeMode.dark : ThemeMode.light,
              onGenerateRoute: appRouter.onGenerateRoute,
              // initialRoute: AppRouter.testScreen,
            );
          },
        ),
      ),
    );
  }
}
