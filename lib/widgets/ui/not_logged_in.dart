import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/note/note_header.dart';
import 'package:waristmate_app/widgets/profile/login_card.dart';

class NotLoggedIn extends StatelessWidget {
  const NotLoggedIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClean,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          NoteHeader(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.lock_outline_rounded,
                  size: 72,
                  color: AppColors.primaryGreen,
                ),

                const SizedBox(height: 20),

                const Text(
                  "Silakan login terlebih dahulu",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Masuk ke akun Anda untuk melihat dan mengelola catatan pribadi.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: AppColors.textDark),
                ),

                const SizedBox(height: 32),

                const LoginCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
