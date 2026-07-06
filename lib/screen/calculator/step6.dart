import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';
import 'package:waristmate_app/widgets/calculator/calculator_header.dart';
import 'package:waristmate_app/widgets/calculator/calculator_nav_button.dart';
import 'package:waristmate_app/widgets/calculator/counter_row.dart';
import 'package:waristmate_app/core/config/theme.dart';

class Step6 extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  const Step6({super.key, required this.onNext, required this.onBack});

  @override
  State<Step6> createState() => _Step6State();
}

class _Step6State extends State<Step6> {
  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<CalculatorController>(context);

    return Column(
      children: [
        CalculatorHeader(stepInfo: "6 dari 9"),

        const SizedBox(height: 5),

        Expanded(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                // main card
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    padding: const EdgeInsets.all(17.5),
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Silahkan isi masing-masing kolom dengan anggota keluarga almarhum/ah yang masih hidup",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Divider(color: Colors.white, height: 32),

                        const Text(
                          "Tarik lingkaran untuk menambah atau mengurangi jumlah anggota keluarga",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          "Saudara Seayah",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 8),

                        CounterRow(
                          label: "Saudara Laki-laki Seayah",
                          value: calc.nilaiSaudaraLakiSeayah,
                          max: 50,
                          onChanged: (v) => calc.updateSaudaraLakiSeayah(v),
                        ),

                        CounterRow(
                          label: "Saudara Perempuan Seayah",
                          value: calc.nilaiSaudaraPerempuanSeayah,
                          max: 50,
                          onChanged: (v) =>
                              calc.updateSaudaraPerempuanSeayah(v),
                        ),

                        const Divider(color: Colors.white, height: 32),
                        const SizedBox(height: 2),

                        const Text(
                          "Tarik lingkaran untuk menambah atau mengurangi jumlah anggota keluarga",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          "Saudara Seibu",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 8),

                        CounterRow(
                          label: "Saudara Laki-Laki Seibu",
                          value: calc.nilaiSaudaraLakiSeibu,
                          max: 50,
                          onChanged: (v) => calc.updateSaudaraLakiSeibu(v),
                        ),

                        CounterRow(
                          label: "Saudara Perempuan Seibu",
                          value: calc.nilaiSaudaraPerempuanSeibu,
                          max: 50,
                          onChanged: (v) => calc.updateSaudaraPerempuanSeibu(v),
                        ),

                        const Divider(color: Colors.white, height: 32),
                        const SizedBox(height: 2),
                      ],
                    ),
                  ),
                ),

                CalculatorNavButton(
                  onBack: widget.onBack,
                  onNext: widget.onNext,
                  labelBack: "Kembali",
                  labelNext: "Lanjut",
                ),

                const SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
