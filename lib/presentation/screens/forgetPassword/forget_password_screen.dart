import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/logic/cubit/auth/auth_cubit.dart';
import 'package:food_app/presentation/routes/screens.dart';
import 'package:food_app/presentation/widgets/custom_card.dart';
import 'package:food_app/presentation/widgets/custom_text_field.dart';
import 'package:food_app/presentation/widgets/main_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Forgot\nPassword?',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomCard(
                children: [
                  CustomTextField(
                    controller: emailController,
                    hint: 'Your Email',
                    onChanged: (val) {},
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: MainButton(
                  title: 'Send',
                  onPressed: () async {
                    await BlocProvider.of<AuthCubit>(context)
                        .sendPasswordResetEmail(emailController.text);
                  },
                ),
              ),
              buildOTPSubmitted(),
            ],
          ),
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
          //Navigator.of(context).pushReplacementNamed(Screens.otpScreen);
          AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.SUCCES,
            title: 'Your password has been reset',
            desc: 'You will shortly receive an email to setup a new password',
            btnOkOnPress: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  Screens.signInScreen, (Route<dynamic> route) => false);
            },
          ).show();
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
