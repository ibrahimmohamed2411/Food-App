import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/constants/original_screen_dimensions.dart';
import 'package:food_app/logic/cubit/auth/auth_cubit.dart';
import 'package:food_app/logic/cubit/signIn/sign_in_cubit.dart';
import 'package:food_app/presentation/routes/screens.dart';
import 'package:food_app/presentation/widgets/custom_card.dart';
import 'package:food_app/presentation/widgets/custom_text_field.dart';
import 'package:food_app/presentation/widgets/google_elevated_button.dart';
import 'package:food_app/presentation/widgets/main_button.dart';
import 'package:formz/formz.dart';

part 'widgets/email_input.dart';

part 'widgets/password_input.dart';

part 'widgets/sign_in_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56 * OriginalScreen.scaleFactor.heightScaleFactor,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: BlocListener<SignInCubit, SignInState>(
          listener: (context, state) {
            if (state.status.isSubmissionInProgress) {
              showProgressIndicator(context);
            } else if (state.status.isSubmissionFailure) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('error'),
                ),
              );
            } else if (state.status.isSubmissionSuccess) {
              Navigator.pop(context);
            }
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10 * OriginalScreen.scaleFactor.widthScaleFactor,
                  vertical: 10 * OriginalScreen.scaleFactor.heightScaleFactor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15 * OriginalScreen.scaleFactor.widthScaleFactor),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize:
                            35 * OriginalScreen.scaleFactor.heightScaleFactor,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Screens.forgetPasswordScreen);
                        },
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                              fontSize: 18 *
                                  OriginalScreen.scaleFactor.heightScaleFactor),
                        ),
                      ),
                    ],
                  ),
                  CustomCard(
                    children: [
                      _EmailInput(),
                      SizedBox(
                        height:
                            10 * OriginalScreen.scaleFactor.heightScaleFactor,
                      ),
                      _PasswordInput(),
                    ],
                  ),
                  SizedBox(
                    height: 21 * OriginalScreen.scaleFactor.heightScaleFactor,
                  ),
                  _SignInButton(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontSize:
                              18 * OriginalScreen.scaleFactor.heightScaleFactor,
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Screens.signUpScreen);
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 20 *
                                OriginalScreen.scaleFactor.heightScaleFactor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10 * OriginalScreen.scaleFactor.heightScaleFactor,
                  ),
                  Center(
                    child: GoogleElevatedButton(
                      title: 'Sign In with Google',
                      onPressed: () async {
                        await BlocProvider.of<SignInCubit>(context)
                            .logInWithGoogle();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

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
