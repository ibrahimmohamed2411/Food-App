import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/colors.dart';

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
          fontSize: 20.sp,
        ),
        onChanged: onChanged,
        onTap: onTap,
        focusNode: focusNode,
        keyboardType: keyboardType,
        controller: controller,
        textInputAction: textInputAction,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          hintText: hint,
          errorText: errorText,
          errorStyle: TextStyle(
            fontSize: 14.h,
          ),
          hintStyle: TextStyle(
            color: KUnFocusTextFieldColor,
            fontSize: 16.h,
          ),
          suffixIcon: suffixIcon,
          suffixIconConstraints: const BoxConstraints(),
          contentPadding: EdgeInsets.fromLTRB(
            0,
            8 * (ScreenUtil().scaleHeight > 1 ? 1 : ScreenUtil().scaleHeight),
            0,
            8 * (ScreenUtil().scaleHeight > 1 ? 1 : ScreenUtil().scaleHeight),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: KUnFocusTextFieldColor, width: 1.5),
          ),
        ),
      ),
    );
  }
}
