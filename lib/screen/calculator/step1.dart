import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/core/config/theme.dart';
import '../../controllers/calculator_controller.dart';
import '../../widgets/ui/input_label.dart';
import '../../widgets/ui/text_field.dart';
import '../../widgets/calculator/calculator_header.dart';
import '../../widgets/calculator/calculator_nav_button.dart';

class Step1 extends StatefulWidget {
  final VoidCallback onNext;
  const Step1({super.key, required this.onNext});

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  final TextEditingController _wasiatController = TextEditingController();
  @override
  void dispose() {
    _wasiatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<CalculatorController>(context);

    return Column(
      children: [
        CalculatorHeader(stepInfo: "1"),

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
                            "Silahkan isi masing-masing kolom sesuai dengan label keterangan tertulis",
                            style: TextStyle(
                              color: AppColors.textLight,
                              fontSize: 17.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          // input harta
                          const InputLabel(label: "Harta yang ditinggalkan"),
                          TextFieldCurrency(
                            label: "Harta yang ditinggalkan",
                            controller: calc.tirkahController,
                            onChanged: (val) {
                              String cleanVal = val
                                  .replaceAll('.', '')
                                  .replaceAll(',', '');
                              int parsedVal = int.tryParse(cleanVal) ?? 0;
                              calc.updateTirkah(parsedVal);
                            },
                          ),

                          const InputLabel(label: "Muwarrits (yang meninggal)"),
                          RadioGroup<String>(
                            groupValue: calc.muwarrits,
                            onChanged: (val) {
                              if (val != null) {
                                calc.updateMuwarrits(val);
                              }
                            },
                            child: Row(
                              children: [
                                Radio<String>(
                                  value: 'Laki-laki',
                                  fillColor: WidgetStateProperty.all(
                                    AppColors.textLight,
                                  ),
                                ),
                                const Text(
                                  "Laki-laki",
                                  style: TextStyle(
                                    color: AppColors.textLight,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 20),

                                Radio<String>(
                                  value: 'Perempuan',
                                  fillColor: WidgetStateProperty.all(
                                    AppColors.textLight,
                                  ),
                                ),
                                const Text(
                                  "Perempuan",
                                  style: TextStyle(
                                    color: AppColors.textLight,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const InputLabel(label: "Biaya pengurusan jenazah"),
                          TextFieldCurrency(
                            label: "Biaya pengurusan jenazah",
                            controller: calc.tajhizController,
                            onChanged: (val) {
                              String cleanVal = val
                                  .replaceAll('.', '')
                                  .replaceAll(',', '');
                              int parsedVal = int.tryParse(cleanVal) ?? 0;
                              calc.updateTajhiz(parsedVal);
                            },
                          ),

                          const InputLabel(label: "Hutang dari muwarrits"),
                          TextFieldCurrency(
                            label: "Hutang dari muwarrits",
                            controller: calc.hutangController,
                            onChanged: (val) {
                              String cleanVal = val
                                  .replaceAll('.', '')
                                  .replaceAll(',', '');
                              int parsedVal = int.tryParse(cleanVal) ?? 0;
                              calc.updateHutang(parsedVal);
                            },
                          ),

                          const InputLabel(
                            label: "Wasiat (maksimal 1/3 sisa harta)",
                          ),
                          TextFieldCurrency(
                            label: "Wasiat (maksimal 1/3 sisa harta)",
                            controller: calc.wasiatController,
                            onChanged: (val) {
                              String cleanVal = val
                                  .replaceAll('.', '')
                                  .replaceAll(',', '');
                              int parsedVal = int.tryParse(cleanVal) ?? 0;

                              String? notip = calc.updateWasiat(parsedVal);
                              if (notip != null) {
                                calc.wasiatController.text = calc.nWasiat
                                    .toString();
                                calc
                                    .wasiatController
                                    .selection = TextSelection.fromPosition(
                                  TextPosition(
                                    offset: calc.wasiatController.text.length,
                                  ),
                                );

                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(notip),
                                    backgroundColor: Colors.red[700],
                                    duration: const Duration(seconds: 3),
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    margin: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height -
                                          17.50,
                                      left: 20,
                                      right: 20,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),

                          const InputLabel(
                            label: "Sisa harta yang diwariskan (Irts)",
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.textLight,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              calc.formatRupiah(calc.nIrst),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17.5,
                                color: AppColors.primaryGreen,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                CalculatorNavButton(
                  onBack: null,
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
