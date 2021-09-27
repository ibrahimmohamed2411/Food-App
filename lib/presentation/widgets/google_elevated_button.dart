import 'package:flutter/material.dart';
import 'package:food_app/constants/original_screen_dimensions.dart';

import 'custom_button.dart';

class GoogleElevatedButton extends StatelessWidget {
  const GoogleElevatedButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);
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
            height: 20 * OriginalScreen.scaleFactor.heightScaleFactor,
          ),
          SizedBox(
            width: 15 * OriginalScreen.scaleFactor.widthScaleFactor,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 18 * OriginalScreen.scaleFactor.heightScaleFactor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      color: const Color(0xff404852),
      onPressed: onPressed,
    );
  }
}
