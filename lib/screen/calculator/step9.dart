import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';
import 'package:waristmate_app/logic/hajb_validator.dart';
import 'package:waristmate_app/widgets/calculator/calculator_header.dart';
import 'package:waristmate_app/widgets/calculator/calculator_nav_button.dart';
import 'package:waristmate_app/widgets/calculator/counter_row.dart';
import 'package:waristmate_app/core/config/theme.dart';

class Step9 extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  const Step9({super.key, required this.onNext, required this.onBack});

  @override
  State<Step9> createState() => _Step9State();
}

class _Step9State extends State<Step9> {
  void saveData() async {
    // final calc = Provider.of<CalculatorController>(context, listen: false);
    // final user = Supabase.instance.client.auth.currentUser;
    // if (user != null) {
    //   calc.saveCalculationHistory(user.id);
    // }
  }

  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<CalculatorController>(context);

    return Column(
      children: [
        CalculatorHeader(stepInfo: "9 dari 9"),

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
                            "Anak Laki-Laki Paman",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 8),

                          CounterRow(
                            label: "Anak Laki-laki Paman Kandung",
                            value: calc.nilaiAnakLakiPamanKandung,
                            max: 50,
                            onChanged: (v) =>
                                calc.updateAnakLakiPamanKandung(v),
                            isMahjub:
                                HajbValidator.anakLakiPamanKandungTerhalang(
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
                                  jmlAnakLakiSaudaraSeayah:
                                      calc.nilaiAnakLakiSaudaraSeayah,
                                  jmlPamanKandung: calc.nilaiPamanKandung,
                                  jmlPamanSekakek: calc.nilaiPamanSekakek,
                                ),
                            infoHajb:
                                HajbValidator.penghalangAnakLakiPamanKandung(
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
                                  jmlAnakLakiSaudaraSeayah:
                                      calc.nilaiAnakLakiSaudaraSeayah,
                                  jmlPamanKandung: calc.nilaiPamanKandung,
                                  jmlPamanSekakek: calc.nilaiPamanSekakek,
                                ),
                          ),

                          CounterRow(
                            label: "Anak Laki-laki Paman Sekakek",
                            value: calc.nilaiAnakLakiPamanSekakek,
                            max: 50,
                            onChanged: (v) =>
                                calc.updateAnakLakiPamanSekakek(v),
                            isMahjub:
                                HajbValidator.anakLakiPamanSekakekTerhalang(
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
                                  jmlAnakLakiSaudaraSeayah:
                                      calc.nilaiAnakLakiSaudaraSeayah,
                                  jmlPamanKandung: calc.nilaiPamanKandung,
                                  jmlPamanSekakek: calc.nilaiPamanSekakek,
                                  jmlAnakLakiPamanSekandung:
                                      calc.nilaiAnakLakiPamanKandung,
                                ),
                            infoHajb:
                                HajbValidator.penghalangAnakLakiPamanSekakek(
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
                                  jmlAnakLakiSaudaraSeayah:
                                      calc.nilaiAnakLakiSaudaraSeayah,
                                  jmlPamanKandung: calc.nilaiPamanKandung,
                                  jmlPamanSekakek: calc.nilaiPamanSekakek,
                                  jmlAnakLakiPamanSekandung:
                                      calc.nilaiAnakLakiPamanKandung,
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
                  onSave: saveData,
                  onCalculate: calc.runEngine,
                  labelBack: "Kembali",
                  labelNext: "Hasil",
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
