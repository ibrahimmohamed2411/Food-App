import 'package:flutter/material.dart';
import 'package:food_app/constants/styles.dart';

import 'package:food_app/presentation/widgets/custom_card.dart';
import 'package:food_app/presentation/widgets/custom_text_field.dart';
import 'package:food_app/presentation/widgets/google_outlined_button.dart';
import 'package:food_app/presentation/widgets/main_button.dart';

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
                    CustomTextField(hint: 'Your Name', onChanged: (val) {}),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                        hint: 'Your Phone Number', onChanged: (val) {}),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      hint: 'Location',
                      onChanged: (val) {},
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.add_location_alt_outlined),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      hint: 'Password',
                      onChanged: (val) {},
                      suffixIcon: const Icon(
                        Icons.remove_red_eye_outlined,
                      ),
                    ),
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
