import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.onPressed,
    required this.foregroundColor,
  }) : super(key: key);

  final Color backgroundColor;
  final String title;
  final VoidCallback? onPressed;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 400,
          height: 60,
          child: Text(
            title,
            style: TextStyle(
              color: foregroundColor,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
