import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/constants/strings.dart';
import 'package:food_app/logic/cubit/auth/auth_cubit.dart';
import 'package:food_app/presentation/widgets/password_field.dart';
import 'package:food_app/presentation/widgets/rounded_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
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
                        Navigator.of(context).pushNamed(forgetPasswordScreen);
                      },
                      child: const Text('Forget password?'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: 'Your Email',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PasswordField(
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'your password less than 6 digits';
                          }
                          return null;
                        },
                        hint: 'Password',
                      ),
                    ],
                  ),
                ),
                Center(
                  child: RoundedButton(
                    title: 'Sign In',
                    backgroundColor: const Color.fromARGB(255, 112, 0, 254),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context)
                            .signInWithEmailAndPassword(
                                emailController.text, passwordController.text);
                      }
                    },
                    foregroundColor: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(signUpScreen);
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
                Center(
                  child: RoundedButton(
                    title: 'Sign In With Google',
                    backgroundColor: Colors.white,
                    onPressed: () async {
                      await BlocProvider.of<AuthCubit>(context)
                          .signInWithGoogle();
                    },
                    foregroundColor: Colors.black,
                  ),
                ),
                buildEmailSubmitted(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEmailSubmitted() {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (p, c) {
        return p != c;
      },
      listener: (BuildContext context, state) {
        if (state is Loading) {
          showProgressIndicator(context);
        }
        if (state is Error) {
          Navigator.of(context).pop(); // close loading indicator
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.black,
              duration: const Duration(seconds: 3),
            ),
          );
        }
        if (state is SignInSuccess) {
          Navigator.of(context).pop();
        }
      },
      child: Container(),
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
