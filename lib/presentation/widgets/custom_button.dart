import 'package:flutter/material.dart';
import 'package:food_app/constants/original_screen_dimensions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.child,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  final Widget child;
  final Color color;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onPressed: onPressed,
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: 20 * OriginalScreen.scaleFactor.widthScaleFactor,
              vertical: 20 * OriginalScreen.scaleFactor.heightScaleFactor),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: child),
    );
  }
}
