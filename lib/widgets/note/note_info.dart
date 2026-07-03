import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class NoteInfo extends StatelessWidget {
  const NoteInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.primaryGreen,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          "Catatan ini ditujukan untuk membantu Anda mengelola aset dan kewajiban pengguna. Adanya catatan ini ditujukan untuk membantu ahli waris dalam memahami kondisi keuangan pengguna.",
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textLight,
          ),
        ),
      ),
    );
  }
}
