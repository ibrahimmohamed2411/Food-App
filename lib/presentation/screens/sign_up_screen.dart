import 'package:flutter/material.dart';
import 'package:food_app/constants/styles.dart';

import 'package:food_app/presentation/widgets/custom_button.dart';
import 'package:food_app/presentation/widgets/custom_card.dart';
import 'package:food_app/presentation/widgets/custom_text_field.dart';

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
                    CustomTextField(hintText: 'Your Name', onChanged: (val) {}),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                        hintText: 'Your Phone Number', onChanged: (val) {}),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      hintText: 'Location',
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
                      hintText: 'Password',
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
                CustomButton(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  color: Theme.of(context).primaryColor,
                ),
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
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.black87,
                    side: const BorderSide(width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {},
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          height: 20,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          'Sign Up with Google',
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
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
// CustomButton(
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Image.asset(
// 'images/google_light.png',
// height: 20,
// ),
// const SizedBox(
// width: 15,
// ),
// const Text(
// 'Sign Up with Google',
// style: TextStyle(fontSize: 18),
// textAlign: TextAlign.center,
// ),
// ],
// ),
// color: Colors.black,
// ),
