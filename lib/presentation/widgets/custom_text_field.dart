import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/constants/original_screen_dimensions.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    this.errorText,
    required this.onChanged,
    this.suffixIcon,
    this.focusNode,
    this.onTap,
    this.keyboardType,
    this.controller,
    this.textInputAction,
    this.obscureText,
  }) : super(key: key);

  final String hint;
  final String? errorText;
  final Function(String) onChanged;
  final TextEditingController? controller;
  final Function()? onTap;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Theme.of(context).primaryColor,
            ),
      ),
      child: TextField(
        style: TextStyle(
          fontSize: 20 * OriginalScreen.scaleFactor.heightScaleFactor,
        ),
        onChanged: onChanged,
        onTap: onTap,
        focusNode: focusNode,
        keyboardType: keyboardType,
        controller: controller,
        textInputAction: textInputAction,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(
              12 * OriginalScreen.scaleFactor.widthScaleFactor,
              24 * OriginalScreen.scaleFactor.heightScaleFactor,
              12 * OriginalScreen.scaleFactor.widthScaleFactor,
              16 * OriginalScreen.scaleFactor.heightScaleFactor),
          hintText: hint,
          errorText: errorText,
          hintStyle: TextStyle(
            color: KUnFocusTextFieldColor,
            fontSize: 16 * OriginalScreen.scaleFactor.heightScaleFactor,
          ),
          suffixIcon: suffixIcon,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.5 * OriginalScreen.scaleFactor.widthScaleFactor),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: KUnFocusTextFieldColor,
                width: 1.5 * OriginalScreen.scaleFactor.widthScaleFactor),
          ),
          errorStyle: TextStyle(
            fontSize: 14 * OriginalScreen.scaleFactor.heightScaleFactor,
          ),
        ),
      ),
    );
  }
}
