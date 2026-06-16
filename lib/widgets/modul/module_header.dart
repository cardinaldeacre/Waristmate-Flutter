import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class ModuleHeader extends StatelessWidget {
  const ModuleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 16, top: 20, bottom: 14),
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
          const Text(
            "MODUL PEMBELAJARAN",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          Image.asset('assets/images/logo_white.png', width: 40),
        ],
      ),
    );
  }
}
