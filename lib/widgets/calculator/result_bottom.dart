import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/core/utils/launcher_helper.dart';
import 'package:waristmate_app/models/calculation_history.dart';
import 'package:waristmate_app/services/calculator/calculation_history_service.dart';
import 'package:waristmate_app/widgets/ui/message_snackbar.dart';

class ResultBottom extends StatefulWidget {
  final VoidCallback? onBack;
  final VoidCallback? onHome;

  const ResultBottom({super.key, this.onBack, this.onHome});
  @override
  State<ResultBottom> createState() => _ResultBottomState();
}

class _ResultBottomState extends State<ResultBottom> {
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
        createdAt: DateTime.now().toUtc().toIso8601String(),
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
    } on PostgrestException catch (e) {
      if (mounted) {
        if (e.code == '22003') {
          debugPrint(
            "Error 22003: Nominal harta terlalu besar untuk disimpan sistem.",
          );
          showMessageSnackbar(
            context,
            "Gagal menyimpan: Nominal harta terlalu besar untuk disimpan sistem.",
            AppColors.errorRed,
          );
        } else {
          showMessageSnackbar(
            context,
            "Terjadi kesalahan sistem: ${e.message}",
            AppColors.errorRed,
          );
        }
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
    return Column(
      children: [
        const SizedBox(height: 40),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 3,
                    vertical: 2,
                  ),
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
                      backgroundColor: AppColors.primaryGreen,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: widget.onHome,
                    child: Text(
                      "Hitung Ulang",
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 3,
                    vertical: 2,
                  ),
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
                      backgroundColor: isSaved
                          ? AppColors.primaryGreen
                          : AppColors.spanBlue,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: isSaved ? null : saveHistory,
                    child: Text(
                      isSaving
                          ? "Menyimpan..."
                          : isSaved
                          ? "Tersimpan"
                          : "Simpan Riwayat",
                      style: TextStyle(
                        color: isSaved
                            ? AppColors.primaryGreen
                            : AppColors.textLight,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        Container(
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
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryGreen,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () async {
              try {
                await LauncherHelper.openWhatsApp();
              } catch (e) {
                if (!context.mounted) return;

                showMessageSnackbar(
                  context,
                  "Terjadi kesalahan saat membuka WhatsApp: $e",
                  AppColors.errorRed,
                );
              }
            },
            child: const Text(
              "Bingung dengan hasilnya? Hubungi ahli",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textLight,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
