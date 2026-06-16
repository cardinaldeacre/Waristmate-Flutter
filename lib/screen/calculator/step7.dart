import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';
import 'package:waristmate_app/logic/hajb_validator.dart';
import 'package:waristmate_app/widgets/calculator/calculator_header.dart';
import 'package:waristmate_app/widgets/calculator/calculator_nav_button.dart';
import 'package:waristmate_app/widgets/calculator/counter_row.dart';
import 'package:waristmate_app/core/config/theme.dart';

class Step7 extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  const Step7({super.key, required this.onNext, required this.onBack});

  @override
  State<Step7> createState() => _Step7State();
}

class _Step7State extends State<Step7> {
  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<CalculatorController>(context);

    return Column(
      children: [
        CalculatorHeader(stepInfo: "7"),

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
                            "Keponakan Laki-laki",
                            style: TextStyle(
                              fontSize: 17.5,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 8),

                          CounterRow(
                            label: "Anak Laki-Laki Saudara Kandung",
                            value: calc.nilaiAnakLakiSaudaraKandung,
                            max: 50,
                            onChanged: (v) =>
                                calc.updateAnakLakiSaudaraKandung(v),
                            isMahjub:
                                HajbValidator.anakLakiSaudaraKandungTerhalang(
                                  nilaiAyah: calc.nilaiAyah,
                                  nilaiKakek: calc.nilaiKakek,
                                  jmlAnakLaki: calc.nilaiAnakLaki,
                                  jmlAnakPerempuan: calc.nilaiAnakPerempuan,
                                  jmlCucuLaki: calc.nilaiCucuLaki,
                                  jmlCucuPerempuan: calc.nilaiCucuPerempuan,
                                  jmlSaudaraLakiKandung:
                                      calc.nilaiSaudaraLakiKandung,
                                  jmlSaudaraPerempuanKandung:
                                      calc.nilaiSaudaraPerempuanKandung,
                                  jmlSaudaraLakiSeayah:
                                      calc.nilaiSaudaraLakiSeayah,
                                  jmlSaudaraPerempuanSeayah:
                                      calc.nilaiSaudaraPerempuanSeayah,
                                ),
                            infoHajb:
                                HajbValidator.penghalangAnakLakiSaudaraKandung(
                                  nilaiAyah: calc.nilaiAyah,
                                  nilaiKakek: calc.nilaiKakek,
                                  jmlAnakLaki: calc.nilaiAnakLaki,
                                  jmlAnakPerempuan: calc.nilaiAnakPerempuan,
                                  jmlCucuLaki: calc.nilaiCucuLaki,
                                  jmlCucuPerempuan: calc.nilaiCucuPerempuan,
                                  jmlSaudaraLakiKandung:
                                      calc.nilaiSaudaraLakiKandung,
                                  jmlSaudaraPerempuanKandung:
                                      calc.nilaiSaudaraPerempuanKandung,
                                  jmlSaudaraLakiSeayah:
                                      calc.nilaiSaudaraLakiSeayah,
                                  jmlSaudaraPerempuanSeayah:
                                      calc.nilaiSaudaraPerempuanSeayah,
                                ),
                          ),

                          CounterRow(
                            label: "Anak Laki-Laki Saudara Seayah",
                            value: calc.nilaiAnakLakiSaudaraSeayah,
                            max: 50,
                            onChanged: (v) =>
                                calc.updateAnakLakiSaudaraSeayah(v),
                            isMahjub:
                                HajbValidator.anakLakiSaudaraSeayahTerhalang(
                                  nilaiAyah: calc.nilaiAyah,
                                  nilaiKakek: calc.nilaiKakek,
                                  jmlAnakLaki: calc.nilaiAnakLaki,
                                  jmlAnakPerempuan: calc.nilaiAnakPerempuan,
                                  jmlCucuLaki: calc.nilaiCucuLaki,
                                  jmlCucuPerempuan: calc.nilaiCucuPerempuan,
                                  jmlSaudaraLakiKandung:
                                      calc.nilaiSaudaraLakiKandung,
                                  jmlSaudaraPerempuanKandung:
                                      calc.nilaiSaudaraPerempuanKandung,
                                  jmlSaudaraLakiSeayah:
                                      calc.nilaiSaudaraLakiSeayah,
                                  jmlSaudaraPerempuanSeayah:
                                      calc.nilaiSaudaraPerempuanSeayah,
                                  jmlAnakLakiSaudaraKandung:
                                      calc.nilaiAnakLakiSaudaraKandung,
                                ),
                            infoHajb:
                                HajbValidator.penghalangAnakLakiSaudaraSeayah(
                                  nilaiAyah: calc.nilaiAyah,
                                  nilaiKakek: calc.nilaiKakek,
                                  jmlAnakLaki: calc.nilaiAnakLaki,
                                  jmlAnakPerempuan: calc.nilaiAnakPerempuan,
                                  jmlCucuLaki: calc.nilaiCucuLaki,
                                  jmlCucuPerempuan: calc.nilaiCucuPerempuan,
                                  jmlSaudaraLakiKandung:
                                      calc.nilaiSaudaraLakiKandung,
                                  jmlSaudaraPerempuanKandung:
                                      calc.nilaiSaudaraPerempuanKandung,
                                  jmlSaudaraLakiSeayah:
                                      calc.nilaiSaudaraLakiSeayah,
                                  jmlSaudaraPerempuanSeayah:
                                      calc.nilaiSaudaraPerempuanSeayah,
                                  jmlAnakLakiSaudaraKandung:
                                      calc.nilaiAnakLakiSaudaraKandung,
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
