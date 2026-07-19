import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/auth_controller.dart';
import 'package:waristmate_app/controllers/personal_note_controller.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/services/personal_note/personal_note_service.dart';
import 'package:waristmate_app/widgets/ui/custom_alert.dart';
import 'package:waristmate_app/widgets/ui/message_snackbar.dart';

class LogoutCard extends StatelessWidget {
  const LogoutCard({super.key});

  Future<void> _signOut(BuildContext context) async {
    final authController = context.read<AuthController>();
    final noteController = context.read<PersonalNoteController>();

    try {
      await authController.signOut();
      await PersonalNoteService().clearLocalData();
      noteController.clearForm();
      noteController.clearState();

      if (context.mounted) {
        showMessageSnackbar(context, 'Berhasil keluar dari akun', AppColors.spanBlue);
      }
    } catch (e) {
      debugPrint('Error signing out: $e');
      if (context.mounted) {
        showMessageSnackbar(context, 'Gagal keluar dari akun', AppColors.errorRed);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: AppColors.errorRed,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
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
        ),
      ),
    );
  }
}
