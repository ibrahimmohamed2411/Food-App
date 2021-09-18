import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.onChanged,
      this.suffixIcon,
      this.focusNode,
      this.onTap})
      : super(key: key);
  final String hintText;
  final Function(String) onChanged;
  final Function()? onTap;
  final Widget? suffixIcon;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: Theme.of(context).primaryColor)),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: KUnFocusTextFieldColor, fontSize: 18),
          suffixIcon: suffixIcon,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: KUnFocusTextFieldColor),
          ),
        ),
        onChanged: onChanged,
        onTap: onTap,
        focusNode: focusNode,
      ),
    );
  }
}
