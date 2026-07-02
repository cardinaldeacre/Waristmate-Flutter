import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/calculator/calculator_header.dart';
import 'package:waristmate_app/widgets/calculator/result_bottom.dart';

class CalculationResult extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onHome;

  const CalculationResult({
    super.key,
    required this.onBack,
    required this.onHome,
  });

  @override
  State<CalculationResult> createState() => _CalculationResultState();
}

class _CalculationResultState extends State<CalculationResult> {
  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<CalculatorController>(context);
    final formatRp = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            CalculatorHeader(stepInfo: "Hasil"),

            const SizedBox(height: 5),

            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
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
                                formatRp.format(calc.nTirkah),
                              ),
                              _buildSummaryRow(
                                "Biaya Pengurusan Jenazah",
                                formatRp.format(calc.nTajhiz),
                              ),
                              _buildSummaryRow(
                                "Hutang dari Muwarrits",
                                formatRp.format(calc.nHutang),
                              ),
                              _buildSummaryRow(
                                "Wasiat",
                                formatRp.format(calc.nWasiat),
                              ),
                              _buildSummaryRow(
                                "Harta yang dibagikan",
                                formatRp.format(calc.nIrst),
                                isHighlight: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    if (calc.kasus.isNotEmpty)
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
                        child: Text(
                          "Jenis Kasus: ${calc.kasus}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70,
                          ),
                        ),
                      ),

                    const SizedBox(height: 20),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Table(
                          defaultColumnWidth: const IntrinsicColumnWidth(),
                          children: [
                            TableRow(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                              ),
                              children: [
                                _buildTableCell("Ahli Waris", isHeader: true),
                                _buildTableCell("Porsi", isHeader: true),
                                _buildTableCell(
                                  "Nominal Total",
                                  isHeader: true,
                                ),
                                _buildTableCell(
                                  "Nominal Per-Orang",
                                  isHeader: true,
                                ),
                              ],
                            ),

                            ...calc.results.map((item) {
                              return TableRow(
                                children: [
                                  _buildTableCell(
                                    "${item['jumlah']} ${item['ahli_waris']}",
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
                    ResultBottom(onBack: widget.onBack, onHome: widget.onHome),
                  ],
                ),
              ),
            ),
          ],
        ),
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

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isHeader ? const Color(0xFFE0E0E0) : Colors.white,
        border: Border.all(color: const Color(0xFFBDBDBD)),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isHeader ? FontWeight.w600 : FontWeight.w400,
          color: isHeader ? Colors.black87 : Colors.black54,
        ),
      ),
    );
  }
}
