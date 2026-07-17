import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class HistoryPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageChange;

  const HistoryPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChange,
  });

  @override
  Widget build(BuildContext context) {
    if (totalPages <= 1) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        boxShadow: [
          BoxShadow(
            color: AppColors.darkShadow.withAlpha(120),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left_rounded),
            color: currentPage > 1
                ? AppColors.primaryGreen
                : AppColors.darkGrey,
            onPressed: currentPage > 1
                ? () => onPageChange(currentPage - 1)
                : null,
          ),

          ...List.generate(totalPages, (index) {
            final pageNumber = index + 1;
            final isSelected = pageNumber == currentPage;

            return GestureDetector(
              onTap: () => onPageChange(pageNumber),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryGreen
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primaryGreen
                        : AppColors.darkGrey,
                  ),
                ),
                child: Center(
                  child: Text(
                    '$pageNumber',
                    style: TextStyle(
                      color: currentPage == pageNumber
                          ? AppColors.textLight
                          : AppColors.textDark,
                    ),
                  ),
                ),
              ),
            );
          }),
          IconButton(
            icon: const Icon(Icons.chevron_right_rounded),
            color: currentPage < totalPages
                ? AppColors.primaryGreen
                : AppColors.darkGrey,
            onPressed: currentPage < totalPages
                ? () => onPageChange(currentPage + 1)
                : null,
          ),
        ],
      ),
    );
  }
}
