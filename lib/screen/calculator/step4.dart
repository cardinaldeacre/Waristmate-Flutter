import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';
import 'package:waristmate_app/logic/hajb_validator.dart';

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
                  "4 dari 9",
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
                      "Kakek & Nenek",
                      style: TextStyle(
                        fontSize: 17.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    _buildCheckboxTile(
                      title: "Kakek dari Ayah",
                      value: calc.nilaiKakek == 1,
                      onChanged: (v) => calc.updateKakek(v ?? false),
                      infoHajb: HajbValidator.penghalangKakek(
                        nilaiAyah: calc.nilaiAyah,
                      ),
                      isMahjub: HajbValidator.kakekTerhalang(
                        nilaiAyah: calc.nilaiAyah,
                      ),
                    ),

                    _buildCheckboxTile(
                      title: "Nenek dari Ayah",
                      value: calc.nilaiNenekAyah == 1,
                      onChanged: (v) => calc.updateNenekAyah(v ?? false),
                      infoHajb: HajbValidator.penghalangNenek(
                        nilaiIbu: calc.nilaiIbu,
                      ),
                      isMahjub: HajbValidator.nenekTerhalang(
                        nilaiIbu: calc.nilaiIbu,
                      ),
                    ),

                    _buildCheckboxTile(
                      title: "Nenek dari Ibu",
                      value: calc.nilaiNenekIbu == 1,
                      onChanged: (v) => calc.updateNenekIbu(v ?? false),
                      infoHajb: HajbValidator.penghalangNenek(
                        nilaiIbu: calc.nilaiIbu,
                      ),
                      isMahjub: HajbValidator.nenekTerhalang(
                        nilaiIbu: calc.nilaiIbu,
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

  Widget _buildCheckboxTile({
    required String title,
    required bool value,
    required Function(bool?) onChanged,
    required bool isMahjub,
    required String? infoHajb,
    double scale = 1,
  }) {
    return Transform.scale(
      scale: scale,
      alignment: Alignment.centerLeft,
      child: isMahjub
          ? Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red[400],
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: Colors.white70,
                    size: 17,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "$title Terhalang oleh $infoHajb",
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ],
              ),
            )
          : CheckboxListTile(
              title: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              value: value,
              checkboxShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              activeColor: Colors.white,
              checkColor: Colors.teal[600],
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              onChanged: onChanged,
            ),
    );
  }
}
