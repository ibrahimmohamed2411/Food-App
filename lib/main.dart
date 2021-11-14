import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/logic/cubit/authentication/authentication_cubit.dart';
import 'package:food_app/logic/cubit/forgotPassword/forgot_password_cubit.dart';
import 'package:food_app/logic/cubit/theme/theme_cubit.dart';
import 'package:food_app/logic/debug/app_bloc_observer.dart';
import 'package:food_app/presentation/screens/test2_screen.dart';

import 'logic/cubit/signInValidation/sign_in_validation_cubit.dart';
import 'logic/cubit/signUpValidation/sign_up_validation_cubit.dart';

/*
DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) =>
    */
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = AppBlocObserver();
  runApp(
    const FoodApp(),
  );
}

class FoodApp extends StatelessWidget {
  const FoodApp({
    Key? key,
  }) : super(key: key);

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
              home: AppView(),
              // onGenerateRoute: AppRouter.onGenerateRoute,
              // initialRoute: AppRouter.testScreen,
            );
          },
        ),
      ),
    );
  }
}
