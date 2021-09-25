import 'package:flutter/material.dart';
import 'package:food_app/presentation/widgets/custom_button.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {Key? key, required this.title, this.color, required this.onPressed})
      : super(key: key);
  final String title;
  final Color? color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      child: Text(
        title,
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
      color: color ?? Theme.of(context).primaryColor,
      onPressed: onPressed,
    );
  }
}
