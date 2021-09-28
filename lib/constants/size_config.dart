import 'package:flutter/cupertino.dart';

class ScaleFactor {
  double heightScaleFactor;
  double widthScaleFactor;
  ScaleFactor(
      {required this.heightScaleFactor, required this.widthScaleFactor});
}

class SizeConfig {
  static ScaleFactor scaleFactor =
      ScaleFactor(heightScaleFactor: 1, widthScaleFactor: 1);
  static const double _originalHeight = 816.0;
  static const double _originalWidth = 432.0;

  static void initialize(
      BoxConstraints boxConstraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      scaleFactor = ScaleFactor(
        heightScaleFactor: boxConstraints.maxHeight / _originalHeight,
        widthScaleFactor: boxConstraints.maxWidth / _originalWidth,
      );
    } else {
      scaleFactor = ScaleFactor(
        heightScaleFactor: boxConstraints.maxWidth / _originalHeight,
        widthScaleFactor: boxConstraints.maxHeight / _originalWidth,
      );
    }
  }
}
