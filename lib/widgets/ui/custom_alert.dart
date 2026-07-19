import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'dart:async';

class CustomAlert extends StatelessWidget {
  final String title;
  final String message;
  final IconData? icon;
  final Color? iconColor;
  final String cancelText;
  final String confirmText;
  final Color? confirmColor;
  final FutureOr<void> Function()? onConfirm;
  final FutureOr<void> Function()? onCancel;

  const CustomAlert({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    this.onCancel,
    this.icon,
    this.iconColor,
    this.cancelText = 'Batal',
    this.confirmText = 'Ya',
    this.confirmColor = AppColors.primaryGreen,
  });

  static Future<void> show(
    BuildContext context, {
    required String title,
    required String message,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
    IconData? icon,
    Color? iconColor,
    String cancelText = 'Batal',
    String confirmText = 'Ya',
    Color? confirmColor,
  }) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlert(
          title: title,
          message: message,
          onConfirm: onConfirm,
          onCancel: onCancel,
          icon: icon,
          iconColor: iconColor,
          cancelText: cancelText,
          confirmText: confirmText,
          confirmColor: confirmColor,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundClean,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: iconColor ?? AppColors.primaryGreen, size: 20),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              title,
              style:  TextStyle(fontSize: 14, color: iconColor, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      content: Text(
        message,
        style: const TextStyle(fontSize: 14, color: AppColors.textDark),
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: BorderSide(color: AppColors.grey),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            if (onCancel != null) onCancel!();
          },
          child: Text(
            cancelText,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textDark,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm?.call();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: confirmColor,
            foregroundColor: AppColors.textLight,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            confirmText,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
