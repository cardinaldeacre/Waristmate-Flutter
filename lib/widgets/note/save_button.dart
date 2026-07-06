import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/personal_note_controller.dart';
import 'package:waristmate_app/core/config/theme.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback? onToggle;
  final Future<void> Function()? onSave;

  const SaveButton({super.key, required this.onToggle, this.onSave});

  @override
  Widget build(BuildContext context) {
    final noteController = context.watch<PersonalNoteController>();

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
        onPressed: noteController.isEditMode
            ? (noteController.canSave ? onSave : null)
            : onToggle,
        backgroundColor: noteController.isEditMode
            ? AppColors.primaryGreen
            : AppColors.gold,
        icon: Icon(
          noteController.isEditMode ? Icons.save : Icons.edit,
          color: AppColors.backgroundClean,
        ),
        label: Text(
          noteController.isEditMode ? "Simpan" : "Edit",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.textLight,
          ),
        ),
      ),
    );
  }
}
