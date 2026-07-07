import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';
import 'package:waristmate_app/widgets/ui/input_label.dart';
import 'package:waristmate_app/widgets/ui/custom_text_field.dart';
import 'package:waristmate_app/widgets/ui/read_only_field.dart';
import 'package:waristmate_app/widgets/calculator/calculator_header.dart';
import 'package:waristmate_app/widgets/calculator/calculator_nav_button.dart';

class Step1 extends StatefulWidget {
  final VoidCallback onNext;
  const Step1({super.key, required this.onNext});

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  final TextEditingController _wasiatController = TextEditingController();

  void _validateAndNext(CalculatorController calc) {
    if (calc.muwarrits.isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            "Pilih dulu jenis kelamin Almarhum/ah sebelum lanjut",
          ),
          backgroundColor: AppColors.errorRed,
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    } else {
      widget.onNext();
    }
  }

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
        CalculatorHeader(stepInfo: "1 dari 9"),

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
                          "Silahkan isi masing-masing kolom sesuai dengan label keterangan tertulis",
                          style: TextStyle(
                            color: AppColors.textLight,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 12),
                        const Divider(color: AppColors.textLight, height: 12),

                        // input harta
                        const InputLabel(
                          label: "Nominal Harta yang ditinggalkan",
                        ),

                        CustomTextField(
                          controller: calc.tirkahController,
                          isCurrency: true,
                          autofillHints: "100.000.000",
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
                                  color: AppColors.grey,
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
                                  color: AppColors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Divider(color: AppColors.textLight, height: 12),
                        const SizedBox(height: 8),
                        const Text(
                          "(Pastikan mengisi secara berurutan, mulai dari atas ke bawah)",
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const InputLabel(label: "Biaya pengurusan jenazah"),
                        CustomTextField(
                          controller: calc.tajhizController,
                          isCurrency: true,
                          autofillHints: "200.000",
                          onChanged: (val) {
                            String cleanVal = val
                                .replaceAll('.', '')
                                .replaceAll(',', '');
                            int parsedVal = int.tryParse(cleanVal) ?? 0;
                            calc.updateTajhiz(parsedVal);
                          },
                        ),

                        const InputLabel(label: "Hutang dari muwarrits"),
                        CustomTextField(
                          controller: calc.hutangController,
                          isCurrency: true,
                          autofillHints: "700.000",
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
                        CustomTextField(
                          controller: calc.wasiatController,
                          isCurrency: true,
                          autofillHints: "5.000.000",
                          onChanged: (val) {
                            String cleanVal = val
                                .replaceAll('.', '')
                                .replaceAll(',', '');
                            int parsedVal = int.tryParse(cleanVal) ?? 0;

                            String? notip = calc.updateWasiat(parsedVal);
                            if (notip != null) {
                              calc.wasiatController.text = calc.nWasiat
                                  .toString();
                              calc.wasiatController.selection =
                                  TextSelection.fromPosition(
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

                        const SizedBox(height: 8),

                        const Text(
                          "(Pastikan wasiat diisi paling akhir, setelah semua kolom di atas terisi)",
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 8),
                        const Divider(color: Colors.white, height: 1),

                        const InputLabel(
                          label: "Sisa harta yang diwariskan (Irts)",
                        ),
                        ReadOnlyField(value: calc.formatRupiah(calc.nIrst)),
                        const SizedBox(height: 6),
                        const Text(
                          "(Tidak perlu diisi, akan dihitung otomatis)",
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const Divider(color: Colors.white, height: 32),
                        const SizedBox(height: 2),
                      ],
                    ),
                  ),
                ),

                CalculatorNavButton(
                  onBack: null,
                  onNext: () => _validateAndNext(calc),
                  labelBack: "Kembali",
                  labelNext: "Lanjut",
                ),

                const SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
