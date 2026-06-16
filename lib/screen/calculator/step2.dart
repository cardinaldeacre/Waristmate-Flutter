import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';
import 'package:waristmate_app/widgets/calculator/counter_row.dart';
import 'package:waristmate_app/widgets/calculator/checkbox_tile.dart';
import 'package:waristmate_app/widgets/calculator/calculator_header.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/calculator/calculator_nav_button.dart';

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

    return Column(
      children: [
        CalculatorHeader(stepInfo: "2"),

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

                          // const SizedBox(height: 10),
                          const Text(
                            "Orang Tua",
                            style: TextStyle(
                              fontSize: 17.5,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          CheckboxTile(
                            title: "Ayah",
                            value: calc.nilaiAyah == 1,
                            onChanged: (value) => calc.updateAyah(value!),
                          ),
                          CheckboxTile(
                            title: "Ibu",
                            value: calc.nilaiIbu == 1,
                            onChanged: (value) => calc.updateIbu(value!),
                          ),

                          if (calc.muwarrits == 'Laki-laki')
                            CounterRow(
                              label: "Jumlah Istri",
                              value: calc.nilaiIstri,
                              max: 4,
                              onChanged: (value) => calc.updateIstri(value),
                            ),
                          if (calc.muwarrits == 'Perempuan')
                            CheckboxTile(
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
                          CounterRow(
                            label: "Anak Laki-laki",
                            value: calc.nilaiAnakLaki,
                            onChanged: (value) => calc.updateAnakLaki(value),
                          ),

                          CounterRow(
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
