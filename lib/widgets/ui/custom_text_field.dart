import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/logic/formatter.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool isCurrency;
  final double? height;

  const CustomTextField({
    super.key,
    this.label,
    this.onChanged,
    this.controller,
    this.isCurrency = false,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        controller: controller,
        keyboardType: isCurrency ? TextInputType.number : TextInputType.text,
        onChanged: onChanged,
        inputFormatters: isCurrency ? [CurrencyFormatter()] : [],
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17.5,
          color: AppColors.darkGreen,
        ),
        decoration: InputDecoration(
          prefixText: isCurrency ? "Rp. " : null,
          prefixStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17.5,
            color: AppColors.darkGreen,
          ),
          filled: true,
          fillColor: AppColors.textLight,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.primaryGreen,
              strokeAlign: BorderSide.strokeAlignOutside,
              width: 3,
            ),
          ),
        ),
      ),
    );
  }
}
