import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/models/calculation_history.dart';
import 'package:waristmate_app/widgets/calculator/calculator_header.dart';
import 'package:waristmate_app/widgets/history/detail_bottom_button.dart';

class HistoryDetailScreen extends StatelessWidget {
  final CalculationHistoryModel data;

  const HistoryDetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final formatRp = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Scaffold(
      backgroundColor: AppColors.backgroundClean,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          const CalculatorHeader(stepInfo: "Detail"),

          const SizedBox(height: 5),

          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSummaryRow(
                              "Harta yang ditinggalkan",
                              formatRp.format(data.hartaKotor),
                            ),
                            _buildSummaryRow(
                              "Biaya Pengurusan Jenazah",
                              formatRp.format(data.pengurusan ?? 0),
                            ),
                            _buildSummaryRow(
                              "Hutang dari Muwarrits",
                              formatRp.format(data.hutang ?? 0),
                            ),
                            _buildSummaryRow(
                              "Wasiat",
                              formatRp.format(data.wasiat ?? 0),
                            ),
                            _buildSummaryRow(
                              "Harta yang dibagikan",
                              formatRp.format(data.hartaBersih),
                              isHighlight: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 2. TABEL HASIL PERHITUNGAN
                  Container(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      "Tabel Hasil Perhitungan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textLight,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.darkGrey),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Table(
                        defaultColumnWidth: const IntrinsicColumnWidth(),
                        children: [
                          TableRow(
                            decoration: const BoxDecoration(
                              color: AppColors.darkGrey,
                            ),
                            children: [
                              _buildTableCell("Ahli Waris", isHeader: true),
                              _buildTableCell("Porsi", isHeader: true),
                              _buildTableCell("Nominal Total", isHeader: true),
                              _buildTableCell(
                                "Nominal Per-Orang",
                                isHeader: true,
                              ),
                            ],
                          ),
                          ...data.results.map((item) {
                            return TableRow(
                              children: [
                                _buildTableCell(
                                  "${item['jumlah']} ${item['ahli_waris']}",
                                  isCenter: false,
                                ),
                                _buildTableCell(item['porsi'].toString()),
                                _buildTableCell(
                                  formatRp.format(item['nominal_total']),
                                ),
                                _buildTableCell(
                                  "${formatRp.format(item['nominal'])} / orang",
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                    ),
                  ),

                  if (data.penghalang.isNotEmpty) ...[
                    const SizedBox(height: 36),

                    Container(
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreen,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        "Ahli Waris yang Terhalang (Mahjub)",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textLight,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.darkGrey),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Table(
                          defaultColumnWidth: const IntrinsicColumnWidth(),
                          children: [
                            TableRow(
                              decoration: const BoxDecoration(
                                color: AppColors.darkGrey,
                              ),
                              children: [
                                _buildTableCell("Ahli Waris", isHeader: true),
                                _buildTableCell("Penghalang", isHeader: true),
                              ],
                            ),
                            ...data.penghalang.map((item) {
                              return TableRow(
                                children: [
                                  _buildTableCell(
                                    item['pewaris'].toString(),
                                    isCenter: false,
                                  ),
                                  _buildTableCell(
                                    "${item['pewaris']} terhalang (mahjub) oleh ${item['penghalang']}",
                                    isCenter: false,
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 36),

                  DetailBottomButton(),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value, {
    bool isHighlight = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: isHighlight ? Colors.amber : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableCell(
    String text, {
    bool isHeader = false,
    bool isCenter = true,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isHeader ? AppColors.primaryGreen : AppColors.cardBackground,
        border: Border.all(color: AppColors.darkGrey),
      ),
      child: Text(
        text,
        textAlign: isCenter ? TextAlign.center : TextAlign.left,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isHeader ? FontWeight.w600 : FontWeight.w400,
          color: isHeader ? AppColors.textLight : AppColors.textDark,
        ),
      ),
    );
  }
}
