import 'package:flutter/cupertino.dart';

class ScaleFactor {
  double heightScaleFactor;
  double widthScaleFactor;
  ScaleFactor(
      {required this.heightScaleFactor, required this.widthScaleFactor});
}

class OriginalScreen {
  static late ScaleFactor scaleFactor;
  static const double height = 759.2727272727273;
  static const double width = 392.72727272727275;
  OriginalScreen(Size size) {
    scaleFactor = ScaleFactor(
      heightScaleFactor: size.height / height,
      widthScaleFactor: size.width / width,
    );
  }
}
