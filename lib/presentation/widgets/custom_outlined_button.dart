import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final ButtonStyle? style;
  final Color? borderColor;
  final Color? primaryColor;
  final Color? backgroundColor;

  const CustomOutlinedButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.style,
    this.borderColor,
    this.primaryColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: style ??
          OutlinedButton.styleFrom(
            primary: primaryColor ?? Colors.black87,
            side: BorderSide(width: 1.w, color: borderColor ?? Colors.black87),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            backgroundColor: backgroundColor,
          ),
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 18.sp),
          ),
        ),
      ),
    );
  }
}
