import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:formz/formz.dart';
import 'package:food_app/constants/styles.dart';
import 'package:food_app/logic/cubit/authentication/authentication_cubit.dart';
import 'package:food_app/logic/cubit/signInValidation/sign_in_validation_cubit.dart';
import 'package:food_app/presentation/routes/app_router.dart';
import 'package:food_app/presentation/widgets/auth_circular_progress.dart';
import 'package:food_app/presentation/widgets/custom_card.dart';
import 'package:food_app/presentation/widgets/custom_text_field.dart';
import 'package:food_app/presentation/widgets/google_elevated_button.dart';
import 'package:food_app/presentation/widgets/main_button.dart';

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
                  title: 'Failed',
                  desc: state.message,
                  btnOkOnPress: () {},
                ).show();

                context.read<SignInValidationCubit>().endSubmit();
              }
            },
          ),
          BlocListener<SignInValidationCubit, SignInValidationState>(
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
                top: 56.h,
                left: 15.w,
                right: 15.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
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
                              .pushNamed(AppRouter.forgetPasswordScreen);
                        },
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ),
                    ],
                  ),
                  CustomCard(
                    children: [
                      const _EmailInput(),
                      SizedBox(
                        height: 10.h,
                      ),
                      const _PasswordInput(),
                    ],
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  const AuthCircularProgress(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: const _SignInButton(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(AppRouter.signUpScreen);
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10.h,
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
