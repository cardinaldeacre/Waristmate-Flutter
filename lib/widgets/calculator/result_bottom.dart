import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/core/utils/launcher_helper.dart';

class ResultBottom extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onHome;

  const ResultBottom({super.key, this.onBack, this.onHome});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              if (onBack != null) ...[
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: onBack,
                    child: const Text(
                      "Kembali",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 20),
              ],

              Expanded(
                child: Container(
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: onHome,
                    child: const Text(
                      "Hitung Ulang",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
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

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Gagal membuka WhatsApp: $e",
                      style: TextStyle(color: AppColors.textLight),
                    ),
                    backgroundColor: AppColors.errorRed,
                  ),
                );
              }
            },
            child: const Text(
              "Bingung dengan hasilnya? Hubungi ahli",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
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
