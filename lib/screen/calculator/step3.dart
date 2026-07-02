import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';
import 'package:waristmate_app/logic/hajb_validator.dart';
import 'package:waristmate_app/widgets/calculator/calculator_header.dart';
import 'package:waristmate_app/widgets/calculator/counter_row.dart';
import 'package:waristmate_app/widgets/calculator/calculator_nav_button.dart';
import 'package:waristmate_app/core/config/theme.dart';

class Step3 extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  const Step3({super.key, required this.onNext, required this.onBack});

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<CalculatorController>(context);

    return Column(
      children: [
        CalculatorHeader(stepInfo: "2 dari 9"),

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
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Silahkan isi masing-masing kolom dengan anggota keluarga yang masih hidup",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Divider(color: Colors.white, height: 32),

                          const Text(
                            "Cucu Kandung",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 8),

                          CounterRow(
                            label: "Cucu Laki-Laki",
                            value: calc.nilaiCucuLaki,
                            max: 50,
                            onChanged: (v) => calc.updateCucuLaki(v),
                            isMahjub: HajbValidator.cucuLakiTerhalang(
                              jmlAnakLaki: calc.nilaiAnakLaki,
                            ),
                            infoHajb: HajbValidator.penghalangCucuLaki(
                              jmlAnakLaki: calc.nilaiAnakLaki,
                            ),
                          ),

                          CounterRow(
                            label: "Cucu Perempuan",
                            value: calc.nilaiCucuPerempuan,
                            max: 50,
                            onChanged: (v) => calc.updateCucuPerempuan(v),
                            isMahjub: HajbValidator.cucuPerempuanTerhalang(
                              jmlAnakLaki: calc.nilaiAnakLaki,
                              jmlAnakPerempuan: calc.nilaiAnakPerempuan,
                            ),
                            infoHajb: HajbValidator.penghalangCucuPerempuan(
                              jmlAnakLaki: calc.nilaiAnakLaki,
                              jmlAnakPerempuan: calc.nilaiAnakPerempuan,
                            ),
                          ),

                          const Divider(color: Colors.white, height: 32),
                          const SizedBox(height: 2),
                        ],
                      ),
                    ),
                  ),
                ),

                CalculatorNavButton(
                  onBack: widget.onBack,
                  onNext: widget.onNext,
                  labelBack: "Kembali",
                  labelNext: "Lanjut",
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
