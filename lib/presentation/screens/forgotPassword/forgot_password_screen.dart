import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/constants/size_config.dart';
import 'package:food_app/logic/cubit/authentication/authentication_cubit.dart';
import 'package:food_app/logic/cubit/forgotPassword/forgot_password_cubit.dart';
import 'package:food_app/presentation/widgets/custom_card.dart';
import 'package:food_app/presentation/widgets/custom_text_field.dart';
import 'package:food_app/presentation/widgets/main_button.dart';

part 'widgets/email_input.dart';

part 'widgets/sign_in_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
            listener: (context, state) {},
          ),
          BlocListener<AuthenticationCubit, AuthenticationState>(
            listener: (context, state) {},
          ),
        ],
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: 56 * SizeConfig.scaleFactor.heightScaleFactor,
              left: 15 * SizeConfig.scaleFactor.widthScaleFactor,
              right: 15 * SizeConfig.scaleFactor.widthScaleFactor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 20 * SizeConfig.scaleFactor.widthScaleFactor),
                  child: Text(
                    'Forgot\nPassword?',
                    style: TextStyle(
                      fontSize: 32 * SizeConfig.scaleFactor.heightScaleFactor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40 * SizeConfig.scaleFactor.heightScaleFactor,
                ),
                const CustomCard(
                  children: [_EmailInput()],
                ),
                SizedBox(
                  height: 30 * SizeConfig.scaleFactor.heightScaleFactor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10 * SizeConfig.scaleFactor.widthScaleFactor),
                  child: const _SignInButton(),
                ),
                //buildOTPSubmitted(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget buildOTPSubmitted() {
  //   return BlocListener<SignInCubit, SignInState>(
  //     listenWhen: (p, c) {
  //       return p != c;
  //     },
  //     listener: (BuildContext context, state) {
  //       if (state is Loading) {
  //         showProgressIndicator(context);
  //       }
  //       if (state is Error) {
  //         Navigator.of(context).pop(); // close loading indicator
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text(state.error),
  //             backgroundColor: Colors.black,
  //             duration: const Duration(seconds: 3),
  //           ),
  //         );
  //       }
  //       if (state is OTPSentSuccessfully) {
  //         //Navigator.of(context).pushReplacementNamed(Screens.otpScreen);
  //         AwesomeDialog(
  //           context: context,
  //           animType: AnimType.SCALE,
  //           dialogType: DialogType.SUCCES,
  //           title: 'Your password has been reset',
  //           desc: 'You will shortly receive an email to setup a new password',
  //           btnOkOnPress: () {
  //             Navigator.of(context).pushNamedAndRemoveUntil(
  //                 Screens.signInScreen, (Route<dynamic> route) => false);
  //           },
  //         ).show();
  //       }
  //     },
  //     child: Container(),
  //   );
  // }

  void showProgressIndicator(BuildContext context) {
    AlertDialog dialog = const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.black),
        ),
      ),
    );
    showDialog(
      context: context,
      builder: (_) => dialog,
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
    );
  }
}
