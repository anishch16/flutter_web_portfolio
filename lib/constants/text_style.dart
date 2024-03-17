import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScaleSize {
  static double textScaler(
      BuildContext context, {
        double maxTextScaleFactor = 2,
        double baseFontSize = 14,
      }) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    double widthFactor = (width / 1400);
    double heightFactor = (height / 700);
    double scaleFactor = min(widthFactor, heightFactor) * maxTextScaleFactor;
    double scaledFontSize = baseFontSize * scaleFactor;
    return max(1, scaledFontSize);
  }
}
