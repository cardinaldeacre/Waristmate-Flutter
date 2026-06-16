import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class CalculatorHeader extends StatelessWidget {
  final String stepInfo;

  const CalculatorHeader({super.key, required this.stepInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 14),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.darkGreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "$stepInfo dari 9",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
          const Text(
            "Kalkulator",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Image.asset('assets/images/logo_white.png', width: 40),
        ],
      ),
    );
  }
}
