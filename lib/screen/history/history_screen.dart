import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/history_controller.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/history/history_card.dart';
import 'package:waristmate_app/widgets/history/history_filter.dart';
import 'package:waristmate_app/widgets/history/history_pagination.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HistoryController>().fetchCalculationHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat Perhitungan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shadowColor: AppColors.darkShadow.withAlpha(200),
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: AppColors.textLight,
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      body: Consumer<HistoryController>(
        builder: (context, controller, child) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryGreen),
            );
          }

          if (controller.histories.isEmpty) {
            return buildEmptyState();
          }

          return Column(
            children: [
              HistoryFilter(
                currentPage: controller.currentPage,
                totalPages: controller.totalPages,
                isAscending: controller.isAsc,
                onToggleSort: controller.toggleSortOrder,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                    itemCount: controller.histories.length,
                    itemBuilder: (context, index) {
                      final history = controller.histories[index];
                      return HistoryCard(
                        data: history,
                        onTap: () {
                          // Handle card tap if needed
                        },
                      );
                    },
                  ),
                ),
              ),
              HistoryPagination(
                currentPage: controller.currentPage,
                totalPages: controller.totalPages,
                onPageChange: controller.changePage,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.history_rounded,
            size: 80,
            color: AppColors.darkGrey,
          ),
          const SizedBox(height: 16),
          const Text(
            'Belum ada riwayat perhitungan',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.darkGrey,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Simpan perhitungan untuk melihat riwayatnya di sini',
            style: TextStyle(fontSize: 14, color: AppColors.darkGrey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
