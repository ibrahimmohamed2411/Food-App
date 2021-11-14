import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:food_app/logic/cubit/authentication/authentication_cubit.dart';
import 'package:food_app/logic/cubit/forgotPassword/forgot_password_cubit.dart';
import 'package:food_app/logic/cubit/signUpValidation/sign_up_validation_cubit.dart';
import 'package:food_app/presentation/widgets/custom_card.dart';
import 'package:food_app/presentation/widgets/custom_text_field.dart';
import 'package:food_app/presentation/widgets/main_button.dart';
import 'package:formz/formz.dart';

part 'widgets/email_input.dart';

part 'widgets/sign_in_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<AuthenticationCubit, AuthenticationState>(
              listener: (context, state) {
            if (state is AuthenticationSuccess) {
              AwesomeDialog(
                context: context,
                animType: AnimType.SCALE,
                dialogType: DialogType.SUCCES,
                title: 'Send Successfully',
                desc:
                    'You will shortly receive an email to setup a new password',
                btnOkOnPress: () {},
              ).show();

              context.read<SignUpValidationCubit>().endSubmit();
            } else if (state is AuthenticationError) {}
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Check internet connection'),
              ),
            );
          }),
          BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
            listener: (context, state) {
              if (state.status == FormzStatus.submissionInProgress) {
                context
                    .read<AuthenticationCubit>()
                    .sendPasswordResetEmail(state.email.value);
              }
            },
          ),
        ],
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: 56.h,
              left: 15.w,
              right: 15.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    'Forgot\nPassword?',
                    style: TextStyle(
                      fontSize: 32.h,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                const CustomCard(
                  children: [_EmailInput()],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
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
