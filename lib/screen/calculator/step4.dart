import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';
// import 'package:waristmate_app/logic/hajb_validator.dart';
import 'package:waristmate_app/widgets/calculator/calculator_header.dart';
import 'package:waristmate_app/widgets/calculator/calculator_nav_button.dart';
import 'package:waristmate_app/widgets/calculator/checkbox_tile.dart';
import 'package:waristmate_app/core/config/theme.dart';

class Step4 extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  const Step4({super.key, required this.onNext, required this.onBack});

  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<CalculatorController>(context);

    return Column(
      children: [
        CalculatorHeader(stepInfo: "4 dari 9"),

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
                          "Centang jika anggota keluarga masih hidup",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          "Kakek & Nenek",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 8),

                        CheckboxTile(
                          title: "Kakek dari Ayah",
                          value: calc.nilaiKakek == 1,
                          onChanged: (v) => calc.updateKakek(v ?? false),
                          // infoHajb: HajbValidator.penghalangKakek(
                          //   nilaiAyah: calc.nilaiAyah,
                          // ),
                          // isMahjub: HajbValidator.kakekTerhalang(
                          //   nilaiAyah: calc.nilaiAyah,
                          // ),
                        ),

                        CheckboxTile(
                          title: "Nenek dari Ayah",
                          value: calc.nilaiNenekAyah == 1,
                          onChanged: (v) => calc.updateNenekAyah(v ?? false),
                          // infoHajb: HajbValidator.penghalangNenek(
                          //   nilaiIbu: calc.nilaiIbu,
                          // ),
                          // isMahjub: HajbValidator.nenekTerhalang(
                          //   nilaiIbu: calc.nilaiIbu,
                          // ),
                        ),

                        CheckboxTile(
                          title: "Nenek dari Ibu",
                          value: calc.nilaiNenekIbu == 1,
                          onChanged: (v) => calc.updateNenekIbu(v ?? false),
                          // infoHajb: HajbValidator.penghalangNenek(
                          //   nilaiIbu: calc.nilaiIbu,
                          // ),
                          // isMahjub: HajbValidator.nenekTerhalang(
                          //   nilaiIbu: calc.nilaiIbu,
                          // ),
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

                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
