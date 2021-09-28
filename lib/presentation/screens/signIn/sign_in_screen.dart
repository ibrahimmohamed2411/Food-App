import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/constants/size_config.dart';
import 'package:food_app/constants/styles.dart';
import 'package:food_app/logic/cubit/authentication/authentication_cubit.dart';
import 'package:food_app/logic/cubit/signIn/sign_in_cubit.dart';
import 'package:food_app/presentation/routes/screens.dart';
import 'package:food_app/presentation/widgets/auth_circular_progress.dart';
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: MultiBlocListener(
        listeners: [
          BlocListener<AuthenticationCubit, AuthenticationState>(
            listener: (context, state) {
              if (state is AuthenticationError) {
                AwesomeDialog(
                  context: context,
                  animType: AnimType.SCALE,
                  dialogType: DialogType.SUCCES,
                  title: 'Your password has been reset',
                  desc:
                      'You will shortly receive an email to setup a new password',
                  btnOkOnPress: () {},
                ).show();

                context.read<SignInCubit>().endSubmit();
              }
            },
          ),
          BlocListener<SignInCubit, SignInState>(
            listener: (context, state) {
              if (state.status.isSubmissionInProgress) {
                context
                    .read<AuthenticationCubit>()
                    .logInWithCredentials(state.email, state.password);
              }
            },
          ),
        ],
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                        left: 15 * SizeConfig.scaleFactor.widthScaleFactor),
                    child: Text(
                      'Sign In',
                      style: KTitle1,
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
                                  SizeConfig.scaleFactor.heightScaleFactor),
                        ),
                      ),
                    ],
                  ),
                  CustomCard(
                    children: [
                      const _EmailInput(),
                      SizedBox(
                        height: 10 * SizeConfig.scaleFactor.heightScaleFactor,
                      ),
                      const _PasswordInput(),
                    ],
                  ),
                  SizedBox(
                    height: 21 * SizeConfig.scaleFactor.heightScaleFactor,
                  ),
                  const AuthCircularProgress(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            10 * SizeConfig.scaleFactor.widthScaleFactor),
                    child: const _SignInButton(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontSize:
                              18 * SizeConfig.scaleFactor.heightScaleFactor,
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
                            fontSize:
                                20 * SizeConfig.scaleFactor.heightScaleFactor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10 * SizeConfig.scaleFactor.heightScaleFactor,
                  ),
                  Center(
                    child: GoogleElevatedButton(
                      title: 'Sign In with Google',
                      onPressed: () async {
                        await BlocProvider.of<AuthenticationCubit>(context)
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
}
