import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class AddItemCard extends StatelessWidget {
  final VoidCallback onAdd;
  final String? label;

  const AddItemCard({super.key, required this.onAdd, this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onAdd,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
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
          children: [
            const SizedBox(width: 4),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 8),
            Text(
              label ?? "Tambah Item",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
