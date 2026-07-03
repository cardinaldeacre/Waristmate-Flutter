import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/logic/formatter.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool isCurrency;
  final double? height;
  final bool readOnly;
  final String? autofillHints;

  const CustomTextField({
    super.key,
    this.label,
    this.onChanged,
    this.controller,
    this.isCurrency = false,
    this.height = 40,
    this.readOnly = false,
    this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        controller: controller,
        keyboardType: isCurrency ? TextInputType.number : TextInputType.text,
        onChanged: onChanged,
        readOnly: readOnly,
        inputFormatters: isCurrency ? [CurrencyFormatter()] : [],
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: AppColors.darkGreen,
        ),
        decoration: InputDecoration(
          hintText: autofillHints,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: AppColors.darkGrey,
          ),
          prefixIcon: isCurrency
              ? const Padding(
                  padding: EdgeInsets.only(left: 16, right: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Rp.",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: AppColors.darkGreen,
                        ),
                      ),
                    ],
                  ),
                )
              : null,
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
              width: readOnly ? 1 : 3,
            ),
          ),
        ),
      ),
    );
  }
}
