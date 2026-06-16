import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';
import 'package:waristmate_app/logic/hajb_validator.dart';
import 'package:waristmate_app/widgets/calculator/calculator_header.dart';
import 'package:waristmate_app/widgets/calculator/calculator_nav_button.dart';
import 'package:waristmate_app/widgets/calculator/counter_row.dart';
import 'package:waristmate_app/core/config/theme.dart';

class Step5 extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  const Step5({super.key, required this.onNext, required this.onBack});

  @override
  State<Step5> createState() => _Step5State();
}

class _Step5State extends State<Step5> {
  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<CalculatorController>(context);

    return Column(
      children: [
        CalculatorHeader(stepInfo: "5"),

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
                              fontSize: 17.5,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Divider(color: Colors.white, height: 32),

                          const Text(
                            "Saudara Kandung",
                            style: TextStyle(
                              fontSize: 17.5,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 8),

                          CounterRow(
                            label: "Saudara Laki-laki Kandung",
                            value: calc.nilaiSaudaraLakiKandung,
                            max: 50,
                            onChanged: (v) => calc.updateSaudaraLakiKandung(v),
                            isMahjub: HajbValidator.saudaraLakiKandungTerhalang(
                              nilaiAyah: calc.nilaiAyah,
                              jmlAnakLaki: calc.nilaiAnakLaki,
                              jmlCucuLaki: calc.nilaiCucuLaki,
                            ),
                            infoHajb:
                                HajbValidator.penghalangSaudaraLakiKandung(
                                  nilaiAyah: calc.nilaiAyah,
                                  jmlAnakLaki: calc.nilaiAnakLaki,
                                  jmlCucuLaki: calc.nilaiCucuLaki,
                                ),
                          ),

                          CounterRow(
                            label: "Saudara Perempuan Kandung",
                            value: calc.nilaiSaudaraPerempuanKandung,
                            max: 50,
                            onChanged: (v) =>
                                calc.updateSaudaraPerempuanKandung(v),
                            isMahjub:
                                HajbValidator.saudaraPerempuanKandungTerhalang(
                                  nilaiAyah: calc.nilaiAyah,
                                  jmlAnakLaki: calc.nilaiAnakLaki,
                                  jmlCucuLaki: calc.nilaiCucuLaki,
                                ),
                            infoHajb:
                                HajbValidator.penghalangSaudaraPerempuanKandung(
                                  nilaiAyah: calc.nilaiAyah,
                                  jmlAnakLaki: calc.nilaiAnakLaki,
                                  jmlCucuLaki: calc.nilaiCucuLaki,
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
