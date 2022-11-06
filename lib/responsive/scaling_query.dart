import 'dart:math';

import 'package:flutter/material.dart';

class ScalingQuery {
  final _guidelineBaseWidth = 350;
  final _guidelineBaseHeight = 680;

  double? shortDimension;
  double? longDimension;

  ScalingQuery(context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    shortDimension = width < height ? width : height;
    longDimension = width < height ? height : width;
  }

  /// For Font size ---------------->>>
  double fontSize(double size) {
    var tempLongDimension = (16 / 9) * shortDimension!;
    return sqrt(pow(tempLongDimension, 2) + pow(shortDimension!, 2)) * (size / 100);
  }

  /// For width size ---------------->>>
  double scale(double size) {
    return shortDimension! / _guidelineBaseWidth * size;
  }

  /// For height size ---------------->>>
  double verticalScale(double size) {
    return longDimension! / _guidelineBaseHeight * size;
  }

  /// For Padding and Merging size ---------------->>>
  double moderateScale(double size, [double factor = 0.5]) {
    return size + (scale(size) - size) * factor;
  }

  /// For Screen full height percentage size ---------------->>>
  double hp(size) {
    return (longDimension! * size) / 100;
  }

  /// For Screen full width percentage size ---------------->>>
  double wp(size) {
    return (shortDimension! * size) / 100;
  }
}
