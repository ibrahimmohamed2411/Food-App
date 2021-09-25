import 'package:flutter/material.dart';

import 'custom_button.dart';

class GoogleElevatedButton extends StatelessWidget {
  const GoogleElevatedButton(
      {Key? key, required this.onPressed, required this.title})
      : super(key: key);
  final Function() onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/google_light.png',
            height: 20,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      color: Color(0xff404852),
      onPressed: () {},
    );
  }
}
