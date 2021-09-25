import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/constants/styles.dart';
import 'package:food_app/logic/cubit/signUp/sign_up_cubit.dart';
import 'package:food_app/presentation/widgets/custom_card.dart';
import 'package:food_app/presentation/widgets/custom_text_field.dart';
import 'package:food_app/presentation/widgets/google_outlined_button.dart';
import 'package:food_app/presentation/widgets/main_button.dart';
import 'package:formz/formz.dart';

part 'widgets/name_input.dart';

part 'widgets/email_input.dart';

part 'widgets/location_input.dart';

part 'widgets/password_input.dart';

part 'widgets/sign_in_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Sign Up',
                    style: KOnBoardingTitleStyle,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                CustomCard(
                  children: [
                    _NameInput(),
                    const SizedBox(
                      height: 15,
                    ),
                    _EmailInput(),
                    const SizedBox(
                      height: 15,
                    ),
                    _LocationInput(),
                    const SizedBox(
                      height: 15,
                    ),
                    _PasswordInput(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                MainButton(title: 'Sign Up', onPressed: () {}),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Do you have an account?',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 18, color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 20,
                ),
                GoogleOutLinedButton(
                  text: 'Sign Up With Google',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
