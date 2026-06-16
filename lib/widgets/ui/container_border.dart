import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class ContainerBorder extends StatelessWidget {
  final Widget child;
  final double size;
  final double borderRadius;

  const ContainerBorder({
    super.key,
    required this.child,
    this.size = 44,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
