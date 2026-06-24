import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waristmate_app/widgets/ui/custom_alert.dart';

class LogoutCard extends StatelessWidget {
  const LogoutCard({super.key});

  Future<void> _signOut(BuildContext context) async {
    try {
      await Supabase.instance.client.auth.signOut();
      await GoogleSignIn().disconnect();

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully signed out!')),
        );
      }
    } catch (e) {
      debugPrint('Error signing out: $e');
      await Supabase.instance.client.auth.signOut();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error signing out. Please try again.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.errorRed,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        title: const Text(
          "Keluar Akun",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textLight,
          ),
        ),
        leading: const Icon(
          Icons.logout_rounded,
          color: AppColors.textLight,
          size: 24,
        ),
        onTap: () {
          CustomAlert.show(
            context,
            title: 'Konfirmasi Keluar',
            message: 'Apakah Anda yakin ingin keluar dari akun ini?',
            onConfirm: () => _signOut(context),
            onCancel: () {},
            icon: Icons.warning_rounded,
            iconColor: AppColors.errorRed,
            cancelText: 'Batal',
            confirmText: 'Keluar',
            confirmColor: AppColors.errorRed,
          );
        },
      ),
    );
  }
}
