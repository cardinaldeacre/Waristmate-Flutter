import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/logic/formatter.dart';

class TextFieldCurrency extends StatelessWidget {
  final String label;
  final Function(String) onChanged;
  final TextEditingController? controller;

  const TextFieldCurrency({
    super.key,
    required this.label,
    required this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        inputFormatters: [CurrencyFormatter()],
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17.5,
          color: AppColors.darkGreen,
        ),
        decoration: InputDecoration(
          prefixText: "Rp. ",
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
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
