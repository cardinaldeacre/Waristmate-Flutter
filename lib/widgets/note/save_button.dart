import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback? onToggle;
  final bool isEditMode;
  final Future<void> Function()? onSave;
  final bool canSave;

  const SaveButton({
    super.key,
    required this.onToggle,
    required this.isEditMode,
    required this.canSave,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 23),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(26),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isEditMode
                ? AppColors.primaryGreen
                : AppColors.gold,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: isEditMode ? (canSave ? onSave : null) : onToggle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isEditMode
                    ? (canSave ? Icons.save : Icons.warning_amber_rounded)
                    : Icons.edit,
                size: 18,
                color: AppColors.textLight,
              ),
              const SizedBox(width: 8),
              Text(
                !isEditMode
                    ? 'Edit Catatan'
                    : canSave
                    ? 'Simpan Catatan'
                    : 'Lengkapi Data',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
