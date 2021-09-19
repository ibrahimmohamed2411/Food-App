import 'package:flutter/material.dart';

import 'custom_button.dart';

class GoogleElevatedButton extends StatelessWidget {
  const GoogleElevatedButton({Key? key, required this.onPress})
      : super(key: key);
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/google_light.png',
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
      color: Colors.black,
      onPressed: () {},
    );
  }
}
