import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';

class CalculationResult extends StatelessWidget {
  const CalculationResult({super.key});
  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<CalculatorController>(context);
    final formatRp = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    const Color primaryGreen = Color.fromARGB(255, 23, 126, 104);
    const Color darkGreen = Color(0xFF105C46);
    print('results' + calc.results.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 20,
                bottom: 14,
              ),
              decoration: BoxDecoration(
                color: primaryGreen,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: darkGreen,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Hasil",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Text(
                    "Kalkulator",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Image.asset('assets/images/logo_white.png', width: 40),
                ],
              ),
            ),

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
                        color: primaryGreen,
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

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Table(
                          columnWidths: const {
                            0: IntrinsicColumnWidth(flex: 2),
                            1: IntrinsicColumnWidth(),
                            2: IntrinsicColumnWidth(flex: 2),
                          },
                          children: [
                            TableRow(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                              ),
                              children: [
                                _buildTableCell("Ahli Waris", isHeader: true),
                                _buildTableCell("Porsi", isHeader: true),
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
                                    item['ahli_waris'].toString(),
                                  ),
                                  _buildTableCell(item['porsi'].toString()),
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

                    const SizedBox(height: 40),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryGreen,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Bingung dengan hasilsnya? Hubungi ahli",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryGreen,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).popUntil((route) => route.isFirst);
                      },
                      child: const Text(
                        "Hitung Ulang",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                    ),
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
