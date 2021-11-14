import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/styles.dart';
import 'package:food_app/data/models/local_user.dart';
import 'package:food_app/logic/cubit/authentication/authentication_cubit.dart';
import 'package:food_app/logic/cubit/signUpValidation/sign_up_validation_cubit.dart';
import 'package:food_app/presentation/widgets/auth_circular_progress.dart';
import 'package:food_app/presentation/widgets/custom_card.dart';
import 'package:food_app/presentation/widgets/custom_text_field.dart';
import 'package:food_app/presentation/widgets/google_outlined_button.dart';
import 'package:food_app/presentation/widgets/main_button.dart';
import 'package:formz/formz.dart';

part 'widgets/name_input.dart';

part 'widgets/email_input.dart';

part 'widgets/location_input.dart';

part 'widgets/password_input.dart';

part 'widgets/sign_up_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //resizeToAvoidBottomInset: false,
      body: MultiBlocListener(
        listeners: [
          BlocListener<AuthenticationCubit, AuthenticationState>(
            listener: (context, state) {
              if (state is AuthenticationSuccess) {
                AwesomeDialog(
                  context: context,
                  animType: AnimType.SCALE,
                  dialogType: DialogType.SUCCES,
                  title: 'Success',
                  desc: 'Your email has been created.',
                  btnOkOnPress: () {
                    Navigator.of(context).pop();
                  },
                ).show();

                context.read<SignUpValidationCubit>().endSubmit();
              }
            },
          ),
          BlocListener<SignUpValidationCubit, SignUpValidationState>(
            listener: (context, state) {
              if (state.status == FormzStatus.submissionInProgress) {
                context
                    .read<AuthenticationCubit>()
                    .createUserWithEmailAndPassword(
                      localUser: LocalUser(
                        name: state.name.value,
                        email: state.email.value,
                        location: state.location.value,
                      ),
                      password: state.password.value,
                    );
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Text(
                      'Sign Up',
                      style: KTitle1,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomCard(
                    children: [
                      const _NameInput(),
                      SizedBox(
                        height: 15.h,
                      ),
                      const _EmailInput(),
                      SizedBox(
                        height: 15.h,
                      ),
                      const _LocationInput(),
                      SizedBox(
                        height: 15.h,
                      ),
                      const _PasswordInput(),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const AuthCircularProgress(),
                  const _SignUpButton(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Do you have an account?',
                        style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Theme.of(context).primaryColor),
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GoogleOutLinedButton(
                    text: 'Sign Up With Google',
                    onPressed: () async {
                      await BlocProvider.of<AuthenticationCubit>(context)
                          .logInWithGoogle();
                    },
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
