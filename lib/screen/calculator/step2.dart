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

        Expanded(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                //  main card
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    padding: const EdgeInsets.all(17.5),
                    decoration: BoxDecoration(
                      color: primaryGreen,
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

                          // const SizedBox(height: 10),
                          const Text(
                            "Orang Tua",
                            style: TextStyle(
                              fontSize: 17.5,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          _buildCheckboxTile(
                            title: "Ayah",
                            value: calc.nilaiAyah == 1,
                            onChanged: (value) => calc.updateAyah(value!),
                          ),
                          _buildCheckboxTile(
                            title: "Ibu",
                            value: calc.nilaiIbu == 1,
                            onChanged: (value) => calc.updateIbu(value!),
                          ),

                          if (calc.muwarrits == 'Laki-laki')
                            _buildCounterRow(
                              label: "Jumlah Istri",
                              value: calc.nilaiIstri,
                              max: 4,
                              onChanged: (value) => calc.updateIstri(value),
                            ),
                          if (calc.muwarrits == 'Perempuan')
                            _buildCheckboxTile(
                              title: "Suami",
                              value: calc.nilaiSuami == 1,
                              onChanged: (value) => calc.updateSuami(value!),
                            ),

                          const Divider(color: Colors.white, height: 32),
                          const SizedBox(height: 2),

                          const Text(
                            "Anak Kandung",
                            style: TextStyle(
                              fontSize: 17.5,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 8),
                          _buildCounterRow(
                            label: "Anak Laki-laki",
                            value: calc.nilaiAnakLaki,
                            onChanged: (value) => calc.updateAnakLaki(value),
                          ),

                          _buildCounterRow(
                            label: "Anak Perempuan",
                            value: calc.nilaiAnakPerempuan,
                            onChanged: (value) =>
                                calc.updateAnakPerempuan(value),
                          ),

                          const Divider(color: Colors.white, height: 32),
                          const SizedBox(height: 2),
                        ],
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
            ),
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

  Widget _buildCheckboxTile({
    required String title,
    required bool value,
    required Function(bool?) onChanged,
    double scale = 1,
  }) {
    return Transform.scale(
      scale: scale,
      alignment: Alignment.centerLeft,
      child: CheckboxListTile(
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
