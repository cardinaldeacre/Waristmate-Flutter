import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';
import 'package:waristmate_app/logic/hajb_validator.dart';
import 'package:waristmate_app/widgets/custom_thumb_shape.dart';

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

    const Color primaryGreen = Color.fromARGB(255, 23, 126, 104);
    const Color darkGreen = Color(0xFF105C46);

    return Column(
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
                  "7 dari 9",
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

        Padding(
          padding: const EdgeInsets.all(20),
          child: Flexible(
            child: Container(
              padding: const EdgeInsets.all(17.5),
              decoration: BoxDecoration(
                color: primaryGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
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

                    _buildCounterRow(
                      label: "Anak Laki-Laki Saudara Kandung",
                      value: calc.nilaiAnakLakiSaudaraKandung,
                      max: 50,
                      onChanged: (v) => calc.updateAnakLakiSaudaraKandung(v),
                      isMahjub: HajbValidator.anakLakiSaudaraKandungTerhalang(
                        nilaiAyah: calc.nilaiAyah,
                        nilaiKakek: calc.nilaiKakek,
                        jmlAnakLaki: calc.nilaiAnakLaki,
                        jmlAnakPerempuan: calc.nilaiAnakPerempuan,
                        jmlCucuLaki: calc.nilaiCuculaki,
                        jmlCucuPerempuan: calc.nilaiCucuperempuan,
                        jmlSaudaraLakiKandung: calc.nilaiSaudaraLakiKandung,
                        jmlSaudaraPerempuanKandung:
                            calc.nilaiSaudaraPerempuanKandung,
                        jmlSaudaraLakiSeayah: calc.nilaiSaudaraLakiSeayah,
                        jmlSaudaraPerempuanSeayah:
                            calc.nilaiSaudaraPerempuanSeayah,
                      ),
                      infoHajb: HajbValidator.penghalangAnakLakiSaudaraKandung(
                        nilaiAyah: calc.nilaiAyah,
                        nilaiKakek: calc.nilaiKakek,
                        jmlAnakLaki: calc.nilaiAnakLaki,
                        jmlAnakPerempuan: calc.nilaiAnakPerempuan,
                        jmlCucuLaki: calc.nilaiCuculaki,
                        jmlCucuPerempuan: calc.nilaiCucuperempuan,
                        jmlSaudaraLakiKandung: calc.nilaiSaudaraLakiKandung,
                        jmlSaudaraPerempuanKandung:
                            calc.nilaiSaudaraPerempuanKandung,
                        jmlSaudaraLakiSeayah: calc.nilaiSaudaraLakiSeayah,
                        jmlSaudaraPerempuanSeayah:
                            calc.nilaiSaudaraPerempuanSeayah,
                      ),
                    ),

                    _buildCounterRow(
                      label: "Anak Laki-Laki Saudara Seayah",
                      value: calc.nilaiAnakLakiSaudaraSeayah,
                      max: 50,
                      onChanged: (v) => calc.updateAnakLakiSaudaraSeayah(v),
                      isMahjub: HajbValidator.anakLakiSaudaraSeayahTerhalang(
                        nilaiAyah: calc.nilaiAyah,
                        nilaiKakek: calc.nilaiKakek,
                        jmlAnakLaki: calc.nilaiAnakLaki,
                        jmlAnakPerempuan: calc.nilaiAnakPerempuan,
                        jmlCucuLaki: calc.nilaiCuculaki,
                        jmlCucuPerempuan: calc.nilaiCucuperempuan,
                        jmlSaudaraLakiKandung: calc.nilaiSaudaraLakiKandung,
                        jmlSaudaraPerempuanKandung:
                            calc.nilaiSaudaraPerempuanKandung,
                        jmlSaudaraLakiSeayah: calc.nilaiSaudaraLakiSeayah,
                        jmlSaudaraPerempuanSeayah:
                            calc.nilaiSaudaraPerempuanSeayah,
                        jmlAnakLakiSaudaraKandung:
                            calc.nilaiAnakLakiSaudaraKandung,
                      ),
                      infoHajb: HajbValidator.penghalangAnakLakiSaudaraSeayah(
                        nilaiAyah: calc.nilaiAyah,
                        nilaiKakek: calc.nilaiKakek,
                        jmlAnakLaki: calc.nilaiAnakLaki,
                        jmlAnakPerempuan: calc.nilaiAnakPerempuan,
                        jmlCucuLaki: calc.nilaiCuculaki,
                        jmlCucuPerempuan: calc.nilaiCucuperempuan,
                        jmlSaudaraLakiKandung: calc.nilaiSaudaraLakiKandung,
                        jmlSaudaraPerempuanKandung:
                            calc.nilaiSaudaraPerempuanKandung,
                        jmlSaudaraLakiSeayah: calc.nilaiSaudaraLakiSeayah,
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
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: widget.onBack,
                  child: const Text(
                    "Kembali",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: widget.onNext,
                  child: const Text(
                    "Lanjut",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCounterRow({
    required String label,
    required int value,
    required Function(int) onChanged,
    required String? infoHajb,
    required bool isMahjub,
    int max = 50,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label ($value)",
          style: const TextStyle(
            fontSize: 17.5,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),

        if (isMahjub)
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.red[400],
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: Colors.white70, size: 17),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Terhalang oleh $infoHajb",
                    style: const TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ],
            ),
          )
        else
          Row(
            children: [
              _containerBorder(
                size: 30,
                borderRadius: 10,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: value > 0 ? () => onChanged(value - 1) : null,
                  child: const Center(
                    child: Icon(Icons.remove, color: Colors.white, size: 17.5),
                  ),
                ),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 17.5,
                    thumbShape: CustomThumbShape(),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.white24,
                    thumbColor: Colors.white,
                    overlayColor: Colors.white12,
                  ),
                  child: Slider(
                    value: value.toDouble(),
                    min: 0,
                    max: max.toDouble(),
                    onChanged: (double newValue) {
                      onChanged(newValue.toInt());
                    },
                  ),
                ),
              ),
              _containerBorder(
                size: 30,
                borderRadius: 10,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: value < max ? () => onChanged(value + 1) : null,
                  child: const Center(
                    child: Icon(Icons.add, color: Colors.white, size: 17.5),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _containerBorder({
    required Widget child,
    double size = 44,
    double borderRadius = 16,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 23, 126, 104),
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
