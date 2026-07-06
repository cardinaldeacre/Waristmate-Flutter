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
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.backgroundClean,
        boxShadow: [
          BoxShadow(
            color: AppColors.darkShadow.withAlpha(120),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: FloatingActionButton.extended(
        heroTag: "editButton",
        onPressed: isEditMode ? (canSave ? onSave : null) : onToggle,
        backgroundColor: isEditMode ? AppColors.primaryGreen : AppColors.gold,
        icon: Icon(
          isEditMode ? Icons.save : Icons.edit,
          color: AppColors.backgroundClean,
        ),
        label: Text(
          isEditMode ? "Simpan" : "Edit",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.textLight,
          ),
        ),
      ),
    );
  }
}
