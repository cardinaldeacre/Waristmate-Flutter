import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/models/calculation_history.dart';

class HistoryCard extends StatelessWidget {
  final CalculationHistoryModel data;
  final VoidCallback onTap;

  const HistoryCard({super.key, required this.data, required this.onTap});

  String _formatDate(String? isoString) {
    if (isoString == null) return 'Waktu tidak diketahui';
    try {
      final date = DateTime.parse(isoString).toLocal();
      return DateFormat('dd MMM yyyy • HH:mm').format(date);
    } catch (e) {
      return 'Format waktu salah';
    }
  }

  String _getAhliWarisSummary(List<Map<String, dynamic>> results) {
    if (results.isEmpty) return 'Tidak ada data ahli waris';
    final names = results
        .map((e) => e['ahli_waris'].toString())
        .take(4)
        .join(', ');
    return results.length > 4 ? '$names, dll...' : names;
  }

  @override
  Widget build(BuildContext context) {
    final formatRp = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkShadow.withAlpha(120),
            blurRadius: 7,
            offset: const Offset(0, -2),
          ),
        ],
        border: Border.all(color: AppColors.primaryGreen, width: 1),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today_rounded,
                    size: 14,
                    color: AppColors.textDark,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _formatDate(data.createdAt),
                    style: const TextStyle(
                      color: AppColors.textDark,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              const Text(
                'Total Harta Bersih',
                style: TextStyle(fontSize: 14, color: AppColors.textDark),
              ),
              Text(
                formatRp.format(data.hartaBersih),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                  fontFamily: 'Gabarito',
                ),
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen.withAlpha(20),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.people_alt_rounded,
                      size: 16,
                      color: AppColors.primaryGreen,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _getAhliWarisSummary(data.results),
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryGreen,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
