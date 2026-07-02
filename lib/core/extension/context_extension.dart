import 'package:flutter/material.dart';
import 'package:waristmate_app/core/responsive/responsive.dart';

extension ContextExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  bool get isSmallScreen => Responsive.isSmallScreen(this);
  bool get isMediumScreen => Responsive.isMedium(this);
  bool get isTabletScreen => Responsive.isTablet(this);

  double get screenWidth => Responsive.width(this);
  double get screenHeight => Responsive.height(this);
}
