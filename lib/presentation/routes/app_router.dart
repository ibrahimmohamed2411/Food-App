import 'package:flutter/material.dart';
import 'package:food_app/presentation/screens/editProfile/edit_profile_screen.dart';

import 'package:food_app/presentation/screens/home/home_screen.dart';
import 'package:food_app/presentation/screens/landing/landing_page.dart';
import 'package:food_app/presentation/screens/profile/profile_screen.dart';
import 'package:food_app/presentation/screens/signIn/sign_in_screen.dart';
import 'package:food_app/presentation/screens/signUp/sign_up_screen.dart';
import 'package:food_app/presentation/screens/forgotPassword/forgot_password_screen.dart';
import 'package:food_app/presentation/screens/OTP/otp_screen.dart';

class AppRouter {
  static const String signInScreen = '/sign-in-screen';
  static const String forgetPasswordScreen = '/forget-password-screen';
  static const String otpScreen = '/otp-screen';
  static const String homeScreen = '/home-screen';
  static const String landingScreen = '/';
  static const String signUpScreen = '/sign-up';
  static const String profileScreen = '/profile';
  static const String editProfileScreen = '/edit-profile';
  static const String testScreen = '/test';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingScreen:
        return MaterialPageRoute(builder: (context) => const LandingPage());
      case signInScreen:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case otpScreen:
        return MaterialPageRoute(builder: (context) => const OTPScreen());
      case forgetPasswordScreen:
        return MaterialPageRoute(
            builder: (context) => const ForgotPasswordScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case editProfileScreen:
        return MaterialPageRoute(
            builder: (context) => const EditProfileScreen());
      // case testScreen:
      //   return MaterialPageRoute(builder: (context) => const TestScreen());
    }
  }
}
