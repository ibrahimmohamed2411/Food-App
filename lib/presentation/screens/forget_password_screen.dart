import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/constants/strings.dart';
import 'package:food_app/logic/cubit/auth/auth_cubit.dart';
import 'package:food_app/presentation/widgets/rounded_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(30, 10, 0, 40),
              child: const Text(
                'Forget\nPassword?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 100,
                child: Card(
                  elevation: 2,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Form(
                        key: formKey,
                        child: TextFormField(
                          validator: (value) {
                            if (!value!.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          controller: emailController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.emailAddress,
                          maxLines: 1,
                          decoration: const InputDecoration(
                            hintText: 'Your Email',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: RoundedButton(
                title: 'Send',
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<AuthCubit>(context)
                        .sendPasswordResetEmail(emailController.text);
                    // Navigator.of(context).pushReplacementNamed(otpScreen);
                  }
                },
                foregroundColor: Colors.white,
              ),
            ),
            buildOTPSubmitted(),
          ],
        ),
      ),
    );
  }

  Widget buildOTPSubmitted() {
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
        if (state is OTPSentSuccessfully) {
          Navigator.of(context).pushReplacementNamed(otpScreen);
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
