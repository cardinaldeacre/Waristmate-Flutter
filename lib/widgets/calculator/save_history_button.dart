import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/models/calculation_history.dart';
import 'package:waristmate_app/services/calculator/calculation_history_service.dart';
import 'package:waristmate_app/widgets/ui/message_snackbar.dart';

class SaveHistoryButton extends StatefulWidget {
  const SaveHistoryButton({super.key});

  @override
  State<SaveHistoryButton> createState() => _SaveHistoryButtonState();
}

class _SaveHistoryButtonState extends State<SaveHistoryButton> {
  bool isSaving = false;
  bool isSaved = false;

  Future<void> saveHistory() async {
    if (isSaving || isSaved) return;

    setState(() {
      isSaving = true;
    });

    try {
      final user = Supabase.instance.client.auth.currentUser;
      if (user == null) {
        showMessageSnackbar(
          context,
          "User tidak ditemukan. Silakan login terlebih dahulu.",
          AppColors.errorRed,
        );
        return;
      }

      final calc = context.read<CalculatorController>();
      final history = CalculationHistoryModel(
        userId: user.id,
        hartaKotor: calc.totalWarisan,
        pengurusan: calc.nTajhiz,
        hutang: calc.nHutang,
        wasiat: calc.nWasiat,
        hartaBersih: calc.sisaWarisan,
        results: calc.results,
        penghalang: calc.penghalang,
      );

      final service = CalculationHistoryService();
      await service.saveCalculation(history);

      if (mounted) {
        setState(() {
          isSaved = true;
        });

        showMessageSnackbar(
          context,
          "Riwayat perhitungan berhasil disimpan.",
          AppColors.primaryGreen,
        );
      }
    } catch (e) {
      if (mounted) {
        showMessageSnackbar(
          context,
          "Terjadi kesalahan: $e",
          AppColors.errorRed,
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: AppColors.backgroundClean,
        boxShadow: [
          BoxShadow(
            color: AppColors.darkShadow.withAlpha(120),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: ElevatedButton.icon(
        onPressed: isSaved ? null : saveHistory,
        icon: isSaving
            ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.textLight,
                ),
              )
            : Icon(
                isSaved
                    ? Icons.check_circle_rounded
                    : Icons.bookmark_add_rounded,
                color: isSaved ? AppColors.lime : AppColors.textLight,
              ),
        label: Text(
          isSaving
              ? "Menyimpan..."
              : isSaved
              ? "Tersimpan"
              : "Simpan Riwayat",
          style: TextStyle(
            color: isSaved ? AppColors.lime : AppColors.textLight,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSaved
              ? AppColors.primaryGreen
              : AppColors.spanBlue,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
