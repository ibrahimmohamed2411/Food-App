import 'package:flutter/material.dart';
import 'package:food_app/presentation/routes/screens.dart';

import 'package:food_app/presentation/screens/forgetPassword/forget_password_screen.dart';
import 'package:food_app/presentation/screens/home/home_screen.dart';
import 'package:food_app/presentation/screens/OTP/otp_screen.dart';
import 'package:food_app/presentation/screens/signUp/sign_up_screen.dart';
import 'package:food_app/presentation/screens/signIn/sign_in_screen.dart';

import '../../main.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Screens.signInScreen:
        return MaterialPageRoute(builder: (ctx) => const SignInScreen());
      case Screens.otpScreen:
        return MaterialPageRoute(builder: (ctx) => const OTPScreen());
      case Screens.forgetPasswordScreen:
        return MaterialPageRoute(builder: (ctx) => ForgetPasswordScreen());
      case Screens.homeScreen:
        return MaterialPageRoute(builder: (ctx) => const HomeScreen());
      case Screens.landingScreen:
        return MaterialPageRoute(builder: (ctx) => const LandingPage());
      case Screens.signUpScreen:
        return MaterialPageRoute(builder: (ctx) => const SignUpScreen());
    }
  }
}
