import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/ui/custom_text_field.dart';
import 'package:waristmate_app/widgets/ui/container_border.dart';

class DynamicItemCard extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController amountController;
  final bool isEditMode;
  final String nameHint;
  final VoidCallback? onRemove;

  const DynamicItemCard({
    super.key,
    required this.isEditMode,
    required this.nameController,
    required this.amountController,
    required this.nameHint,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    if (!isEditMode) {
      return SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              nameController.text.isEmpty ? '-' : nameController.text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryGreen,
              ),
            ),
            Text(
              "Rp ${amountController.text.isEmpty ? '0' : amountController.text}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryGreen,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.backgroundClean,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(26),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                CustomTextField(
                  controller: nameController,
                  label: nameHint,
                  isCurrency: false,
                  height: 36,
                ),
                const SizedBox(height: 4),
                CustomTextField(
                  controller: amountController,
                  label: 'nominal',
                  isCurrency: true,
                  height: 36,
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          ContainerBorder(
            size: 36,
            borderRadius: 12,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: onRemove,
              child: const Center(
                child: Icon(Icons.remove, color: Colors.white, size: 17.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
