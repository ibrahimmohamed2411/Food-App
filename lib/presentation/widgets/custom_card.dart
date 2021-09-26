import 'package:flutter/material.dart';
import 'package:food_app/constants/original_screen_dimensions.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.children,
    this.padding,
  }) : super(key: key);
  final List<Widget> children;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Color(0xffECEDF1),
              spreadRadius: 4,
              blurRadius: 6,
            ),
          ]),
      child: Padding(
        padding: padding ??
            EdgeInsets.symmetric(
                horizontal: 20 * OriginalScreen.scaleFactor.widthScaleFactor,
                vertical: 30 * OriginalScreen.scaleFactor.heightScaleFactor),
        child: Column(children: children),
      ),
    );
  }
}
