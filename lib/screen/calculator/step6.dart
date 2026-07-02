import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';
import 'package:waristmate_app/logic/hajb_validator.dart';
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
                            "Saudara Seayah",
                            style: TextStyle(
                              fontSize: 17,
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
                            isMahjub: HajbValidator.saudaraLakiSeayahTerhalang(
                              nilaiAyah: calc.nilaiAyah,
                              jmlAnakLaki: calc.nilaiAnakLaki,
                              jmlAnakPerempuan: calc.nilaiAnakPerempuan,
                              jmlCucuLaki: calc.nilaiCucuLaki,
                              jmlCucuPerempuan: calc.nilaiCucuPerempuan,
                              jmlSaudaraLakiKandung:
                                  calc.nilaiSaudaraLakiKandung,
                              jmlSaudaraPerempuanKandung:
                                  calc.nilaiSaudaraPerempuanKandung,
                            ),
                            infoHajb: HajbValidator.penghalangSaudaraLakiSeayah(
                              nilaiAyah: calc.nilaiAyah,
                              jmlAnakLaki: calc.nilaiAnakLaki,
                              jmlAnakPerempuan: calc.nilaiAnakPerempuan,
                              jmlCucuLaki: calc.nilaiCucuLaki,
                              jmlCucuPerempuan: calc.nilaiCucuPerempuan,
                              jmlSaudaraLakiKandung:
                                  calc.nilaiSaudaraLakiKandung,
                              jmlSaudaraPerempuanKandung:
                                  calc.nilaiSaudaraPerempuanKandung,
                            ),
                          ),

                          CounterRow(
                            label: "Saudara Perempuan Seayah",
                            value: calc.nilaiSaudaraPerempuanSeayah,
                            max: 50,
                            onChanged: (v) =>
                                calc.updateSaudaraPerempuanSeayah(v),
                            isMahjub:
                                HajbValidator.saudaraPerempuanSeayahTerhalang(
                                  nilaiAyah: calc.nilaiAyah,
                                  jmlAnakLaki: calc.nilaiAnakLaki,
                                  jmlAnakPerempuan: calc.nilaiAnakPerempuan,
                                  jmlCucuLaki: calc.nilaiCucuLaki,
                                  jmlCucuPerempuan: calc.nilaiCucuPerempuan,
                                  jmlSaudaraLakiKandung:
                                      calc.nilaiSaudaraLakiKandung,
                                  jmlSaudaraPerempuanKandung:
                                      calc.nilaiSaudaraPerempuanKandung,
                                ),
                            infoHajb:
                                HajbValidator.penghalangSaudaraPerempuanSeayah(
                                  nilaiAyah: calc.nilaiAyah,
                                  jmlAnakLaki: calc.nilaiAnakLaki,
                                  jmlAnakPerempuan: calc.nilaiAnakPerempuan,
                                  jmlCucuLaki: calc.nilaiCucuLaki,
                                  jmlCucuPerempuan: calc.nilaiCucuPerempuan,
                                  jmlSaudaraLakiKandung:
                                      calc.nilaiSaudaraLakiKandung,
                                  jmlSaudaraPerempuanKandung:
                                      calc.nilaiSaudaraPerempuanKandung,
                                ),
                          ),

                          const Divider(color: Colors.white, height: 32),
                          const SizedBox(height: 2),

                          const Text(
                            "Saudara Seibu",
                            style: TextStyle(
                              fontSize: 17,
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
                            isMahjub: HajbValidator.saudaraLakiSeibuTerhalang(
                              nilaiAyah: calc.nilaiAyah,
                              jmlAnakLaki: calc.nilaiAnakLaki,
                              jmlAnakPerempuan: calc.nilaiAnakPerempuan,
                              jmlCucuLaki: calc.nilaiCucuLaki,
                              jmlCucuPerempuan: calc.nilaiCucuPerempuan,
                            ),
                            infoHajb: HajbValidator.penghalangSaudaraLakiSeibu(
                              nilaiAyah: calc.nilaiAyah,
                              jmlAnakLaki: calc.nilaiAnakLaki,
                              jmlAnakPerempuan: calc.nilaiAnakPerempuan,
                              jmlCucuLaki: calc.nilaiCucuLaki,
                              jmlCucuPerempuan: calc.nilaiCucuPerempuan,
                            ),
                          ),

                          CounterRow(
                            label: "Saudara Perempuan Seibu",
                            value: calc.nilaiSaudaraPerempuanSeibu,
                            max: 50,
                            onChanged: (v) =>
                                calc.updateSaudaraPerempuanSeibu(v),
                            isMahjub:
                                HajbValidator.saudaraPerempuanSeibuTerhalang(
                                  nilaiAyah: calc.nilaiAyah,
                                  jmlAnakLaki: calc.nilaiAnakLaki,
                                  jmlAnakPerempuan: calc.nilaiAnakPerempuan,
                                  jmlCucuLaki: calc.nilaiCucuLaki,
                                  jmlCucuPerempuan: calc.nilaiCucuPerempuan,
                                ),
                            infoHajb:
                                HajbValidator.penghalangSaudaraPerempuanSeibu(
                                  nilaiAyah: calc.nilaiAyah,
                                  jmlAnakLaki: calc.nilaiAnakLaki,
                                  jmlAnakPerempuan: calc.nilaiAnakPerempuan,
                                  jmlCucuLaki: calc.nilaiCucuLaki,
                                  jmlCucuPerempuan: calc.nilaiCucuPerempuan,
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
