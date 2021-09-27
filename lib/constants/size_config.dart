import 'package:flutter/cupertino.dart';

class ScaleFactor {
  double heightScaleFactor;
  double widthScaleFactor;

  ScaleFactor(
      {required this.heightScaleFactor, required this.widthScaleFactor});
}

class OriginalScreen {
  static late ScaleFactor scaleFactor;
  static const double _height = 759.2727272727273;
  static const double _width = 392.72727272727275;

  OriginalScreen({required double height, required double width}) {
    scaleFactor = ScaleFactor(
      heightScaleFactor: height / _height,
      widthScaleFactor: width / _width,
    );
  }
}
