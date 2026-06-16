import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class CalculatorNavButton extends StatelessWidget {
  final VoidCallback? onNext;
  final VoidCallback? onBack;
  final String? labelNext;
  final String? labelBack;

  const CalculatorNavButton({
    super.key,
    this.onNext,
    this.onBack,
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

            if (onNext != null) ...[const SizedBox(width: 20)],
          ],

          if (onNext != null) ...[
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: onNext,
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
          ],
        ],
      ),
    );
  }
}
