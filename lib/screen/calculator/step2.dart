import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';
import 'package:waristmate_app/widgets/custom_thumb_shape.dart';

class Step2 extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  const Step2({super.key, required this.onNext, required this.onBack});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
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
                  "2 dari 9",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
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

                    const SizedBox(height: 20),
                    // const Divider(color: Colors.white, height: 1, thickness: 3),
                    // const SizedBox(height: 5),
                    const Text(
                      "Orang Tua",
                      style: TextStyle(
                        fontSize: 17.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    CheckboxListTile(
                      title: const Text(
                        "Ayah",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      value: calc.nilaiAyah,
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      activeColor: Colors.white,
                      checkColor: darkGreen,
                      contentPadding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(
                        horizontal: -4,
                        vertical: -4,
                      ),
                      onChanged: (value) {
                        calc.updateAyah(value!);
                      },
                    ),

                    CheckboxListTile(
                      title: const Text(
                        "Ibu",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      value: calc.nilaiIbu,
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      activeColor: Colors.white,
                      checkColor: darkGreen,
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity(
                        horizontal: -4,
                        vertical: -4,
                      ),
                      onChanged: (value) {
                        calc.updateIbu(value!);
                      },
                    ),

                    // const Divider(color: Colors.white, height: 1, thickness: 3),
                    if (calc.muwarrits == 'Laki-laki') ...[
                      const SizedBox(height: 20),
                    ],

                    _buildCounterRow(
                      label: "Jumlah Anak Laki-laki",
                      value: calc.nilaiAnaklaki,
                      onChanged: (value) => calc.updateAnakLaki(value),
                    ),

                    _buildCounterRow(
                      label: "Jumlah Anak Perempuan",
                      value: calc.nilaiAnakPerempuan,
                      onChanged: (value) => calc.updateAnakPerempuan(value),
                    ),
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
