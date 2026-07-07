import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class CalculatorNavButton extends StatelessWidget {
  final VoidCallback? onNext;
  final VoidCallback? onBack;
  final VoidCallback? onSave;
  final VoidCallback? onCalculate;
  final String? labelNext;
  final String? labelBack;

  const CalculatorNavButton({
    super.key,
    this.onNext,
    this.onBack,
    this.onSave,
    this.onCalculate,
    this.labelNext,
    this.labelBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          if (onBack != null) ...[
            Expanded(
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
                    backgroundColor: AppColors.primaryGreen,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: onBack,
                  child: Text(
                    labelBack ?? "Kembali",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),

            if (onNext != null) ...[const SizedBox(width: 20)],
          ],

          if (onNext != null) ...[
            Expanded(
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
                    backgroundColor: AppColors.primaryGreen,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (onSave != null) {
                      onSave?.call();
                    }

                    if (onCalculate != null) {
                      onCalculate?.call();
                    }

                    onNext?.call();
                  },
                  child: Text(
                    labelNext ?? "Lanjut",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
