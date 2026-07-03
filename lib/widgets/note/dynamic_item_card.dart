import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/ui/custom_text_field.dart';
import 'package:waristmate_app/widgets/ui/container_border.dart';

class DynamicItemCard extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController amountController;
  final Function(String)? onChanged;
  final bool isEditMode;
  final bool? isAsset;
  final String? nameHint;
  final String? amountHint;
  final VoidCallback? onRemove;

  const DynamicItemCard({
    super.key,
    required this.isEditMode,
    required this.nameController,
    required this.amountController,
    this.nameHint,
    this.amountHint,
    this.onRemove,
    this.onChanged,
    this.isAsset,
  });

  @override
  Widget build(BuildContext context) {
    String amountText = amountController.text.replaceAll(RegExp(r'[^0-9]'), '');
    int amountValue = int.tryParse(amountText) ?? 0;

    String formattedAmount = NumberFormat.currency(
      locale: 'id_ID',
      symbol: '',
      decimalDigits: 0,
    ).format(amountValue);

    if (!isEditMode) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(15),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                nameController.text.isEmpty ? '-' : nameController.text,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryGreen,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              formattedAmount,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: isAsset == true
                    ? AppColors.primaryGreen
                    : AppColors.errorRed,
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
                  autofillHints: nameHint,
                  isCurrency: false,
                  height: 36,
                  onChanged: onChanged,
                ),
                const SizedBox(height: 4),
                CustomTextField(
                  controller: amountController,
                  autofillHints: amountHint,
                  isCurrency: true,
                  height: 36,
                  onChanged: onChanged,
                ),
              ],
            ),
          ),

          if (isEditMode && onRemove != null) ...[
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
        ],
      ),
    );
  }
}
