import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/data/repositories/products_repository.dart';
import 'package:food_app/logic/cubit/authentication/authentication_cubit.dart';
import 'package:food_app/logic/cubit/forgotPassword/forgot_password_cubit.dart';
import 'package:food_app/logic/cubit/products/products_cubit.dart';
import 'package:food_app/logic/cubit/theme/theme_cubit.dart';
import 'package:food_app/logic/debug/app_bloc_observer.dart';
import 'package:food_app/presentation/routes/app_router.dart';
import 'package:food_app/presentation/screens/changePassword/change_passworrd_screen.dart';
import 'package:food_app/presentation/screens/payment/payment_screen.dart';

import 'constants/styles.dart';
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
  ProductsRepository().geProducts();
  Bloc.observer = AppBlocObserver();
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
          create: (BuildContext context) => ProductsCubit()..getProducts(),
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
                  headline1: KHeadline1,
                ),
              ),
              darkTheme: ThemeData.dark(),
              themeMode: state ? ThemeMode.dark : ThemeMode.light,
              onGenerateRoute: AppRouter.onGenerateRoute,
            );
          },
        ),
      ),
    );
  }
}
