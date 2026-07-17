import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class HistoryFilter extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final bool isAscending;
  final VoidCallback onToggleSort;

  const HistoryFilter({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.isAscending,
    required this.onToggleSort,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
            child: Text(
              'Halaman $currentPage dari $totalPages',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.textDark,
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkShadow.withAlpha(120),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextButton.icon(
                onPressed: onToggleSort,
                icon: Icon(
                  isAscending
                      ? Icons.arrow_upward_rounded
                      : Icons.arrow_downward_rounded,
                  size: 18,
                  color: AppColors.textLight,
                ),
                label: Text(
                  isAscending ? 'Terlama' : 'Terbaru',
                  style: const TextStyle(
                    color: AppColors.textLight,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
