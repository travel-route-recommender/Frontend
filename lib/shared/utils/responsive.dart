import 'package:flutter/material.dart';

abstract final class Responsive {
  static const double horizontalPadding = 24;
  static const double cardRadius = 24;
  static const double cardRadiusLarge = 32;
  static const double buttonHeight = 56;

  static double screenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  static bool isSmallScreen(BuildContext context) {
    return screenWidth(context) < 360;
  }
}
