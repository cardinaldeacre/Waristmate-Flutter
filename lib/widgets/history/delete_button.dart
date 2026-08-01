import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/history_controller.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/ui/custom_alert.dart';
import 'package:waristmate_app/widgets/ui/message_snackbar.dart';

class DeleteBottomButton extends StatefulWidget {
  final int historyId;

  const DeleteBottomButton({super.key, required this.historyId});

  @override
  State<DeleteBottomButton> createState() => _DeleteBottomButtonState();
}

class _DeleteBottomButtonState extends State<DeleteBottomButton> {
  bool isDeleting = false;

    Future<void> confirmDeleteHistory() async {
    await showDialog<void>(
      context: context,
      builder: (context) => CustomAlert(
        title: 'Hapus Riwayat Perhitunga?',
        message:
            'Riwayat perhitungan ini akan dihapus secara permanen. Apakah Anda yakin ingin melanjutkan?',
        icon: Icons.warning_amber_rounded,
        iconColor: AppColors.errorRed,
        cancelText: 'Batal',
        confirmText: 'Hapus',
        confirmColor: AppColors.errorRed,
        onCancel: () {},
        onConfirm: deleteHistory,
      ),
    );
  }

  Future<void> deleteHistory() async {
    if (isDeleting) return;

    setState(() {
      isDeleting = true;
    });

    try {
      await context.read<HistoryController>().deleteCalculationHistory(widget.historyId);

      if (mounted) {
        showMessageSnackbar(
          context,
          "Riwayat berhasil dihapus",
          AppColors.primaryGreen,
        );

        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        showMessageSnackbar(
          context,
          "Gagal menghapus riwayat",
          AppColors.errorRed,
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          isDeleting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
          decoration: BoxDecoration(
            color: AppColors.backgroundClean,
            boxShadow: [
              BoxShadow(
                color: AppColors.darkShadow.withAlpha(120),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.errorRed,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: isDeleting ? null : confirmDeleteHistory,
            child: isDeleting 
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: AppColors.primaryGreen,
                    strokeWidth: 2.5,
                  ),
                )
              : Text(
                  "Hapus Riwayat",
                  style: TextStyle(
                    color: AppColors.textLight, 
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
            ),
          ),
        ),
    );
  }
}
