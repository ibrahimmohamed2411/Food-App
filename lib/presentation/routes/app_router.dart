import 'package:flutter/material.dart';

import 'package:food_app/presentation/routes/screens.dart';
import 'package:food_app/presentation/screens/forgotPassword/forgot_password_screen.dart';
import 'package:food_app/presentation/screens/home/home_screen.dart';
import 'package:food_app/presentation/screens/OTP/otp_screen.dart';
import 'package:food_app/presentation/screens/landing/landing_page.dart';
import 'package:food_app/presentation/screens/signUp/sign_up_screen.dart';
import 'package:food_app/presentation/screens/signIn/sign_in_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Screens.landingScreen:
        return MaterialPageRoute(builder: (ctx) => const LandingPage());
      case Screens.signInScreen:
        return MaterialPageRoute(builder: (ctx) => const SignInScreen());
      case Screens.otpScreen:
        return MaterialPageRoute(builder: (ctx) => const OTPScreen());
      case Screens.forgetPasswordScreen:
        return MaterialPageRoute(
            builder: (ctx) => const ForgotPasswordScreen());
      case Screens.homeScreen:
        return MaterialPageRoute(builder: (ctx) => const HomeScreen());
      case Screens.signUpScreen:
        return MaterialPageRoute(builder: (ctx) => const SignUpScreen());
    }
  }
}
