import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.headline1,
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
                      child: const Text(
                        'Forget Password?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                CustomCard(
                  children: [
                    _EmailInput(),
                    const SizedBox(
                      height: 10,
                    ),
                    _PasswordInput(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                _SignInButton(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Screens.signUpScreen);
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: GoogleElevatedButton(
                    title: 'Sign In with Google',
                    onPressed: () async {
                      await BlocProvider.of<AuthCubit>(context)
                          .signInWithGoogle();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
