import 'package:flutter/material.dart';

class Responsive {
  Responsive._();

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 360;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static bool isSmall(BuildContext context) {
    return MediaQuery.of(context).size.width < 360;
  }

  static bool isMedium(BuildContext context) {
    return MediaQuery.of(context).size.width >= 360 &&
        MediaQuery.of(context).size.width < 600;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600;
  }
}
