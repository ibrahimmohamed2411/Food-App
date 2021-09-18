import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/strings.dart';
import 'package:food_app/main.dart';
import 'package:food_app/presentation/screens/forget_password_screen.dart';
import 'package:food_app/presentation/screens/home_screen.dart';
import 'package:food_app/presentation/screens/otp_screen.dart';
import 'package:food_app/presentation/screens/sign_up_screen.dart';
import 'package:food_app/presentation/screens/signin_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signInScreen:
        return MaterialPageRoute(builder: (ctx) => SignInScreen());
      case otpScreen:
        return MaterialPageRoute(builder: (ctx) => OTPScreen());
      case forgetPasswordScreen:
        return MaterialPageRoute(builder: (ctx) => ForgetPasswordScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (ctx) => HomeScreen());
      // case landingScreen:
      //   return MaterialPageRoute(builder: (ctx) => LandingPage());
      case signUpScreen:
        return MaterialPageRoute(builder: (ctx) => SignUpScreen());
    }
  }
}
