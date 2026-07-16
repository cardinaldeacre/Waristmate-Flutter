import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

void showMessageSnackbar(
  BuildContext context,
  String message,
  Color backgroundColor,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: AppColors.textLight),
      ),
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
    ),
  );
}
