import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/logic/formatter.dart';
import '../../controllers/calculator_controller.dart';
// import 'package:intl/intl.dart';

class Step1 extends StatelessWidget {
  final VoidCallback onNext;

  const Step1({super.key, required this.onNext});

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
                  "1 dari 9",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                "Kalkulator",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Image.asset('assets/images/logo_white.png', width: 40),
            ],
          ),
        ),

        // main card
        Padding(
          padding: const EdgeInsets.all(20),
          child: Flexible(
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: primaryGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Silahkan isi masing-masing kolom sesuai dengan label keterangan tertulis",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),

                    // input harta
                    _buildInputLabel("Harta yang ditinggalkan"),
                    _buildTextField(
                      onChanged: (val) {
                        String cleanVal = val
                            .replaceAll('.', '')
                            .replaceAll(',', '');
                        int parsedVal = int.tryParse(cleanVal) ?? 0;
                        calc.updateTirkah(parsedVal);
                      },
                    ),

                    _buildInputLabel("Muwarrits (yang meninggal)"),
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
                            fillColor: WidgetStateProperty.all(Colors.white),
                          ),
                          const Text(
                            "Laki-laki",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 20),

                          Radio<String>(
                            value: 'Perempuan',
                            fillColor: WidgetStateProperty.all(Colors.white),
                          ),
                          const Text(
                            "Perempuan",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    _buildInputLabel("Biaya pengurusan jenazah"),
                    _buildTextField(
                      onChanged: (val) {
                        String cleanVal = val
                            .replaceAll('.', '')
                            .replaceAll(',', '');
                        int parsedVal = int.tryParse(cleanVal) ?? 0;
                        calc.updateTajhiz(parsedVal);
                      },
                    ),

                    _buildInputLabel("Hutang dari muwarrits"),
                    _buildTextField(
                      onChanged: (val) {
                        String cleanVal = val
                            .replaceAll('.', '')
                            .replaceAll(',', '');
                        int parsedVal = int.tryParse(cleanVal) ?? 0;
                        calc.updateHutang(parsedVal);
                      },
                    ),

                    _buildInputLabel("Wasiat (maksimal 1/3 sisa harta)"),
                    _buildTextField(
                      onChanged: (val) {
                        String cleanVal = val
                            .replaceAll('.', '')
                            .replaceAll(',', '');
                        int parsedVal = int.tryParse(cleanVal) ?? 0;
                        calc.updateWasiat(parsedVal);
                      },
                    ),

                    _buildInputLabel("Sisa harta yang diwariskan (Irts)"),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        calc.formattedIrst,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
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
                  onPressed: null,
                  child: const Text(
                    "Kembali",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
                  onPressed: onNext,
                  child: const Text(
                    "Lanjut",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTextField({required Function(String) onChanged}) {
    return SizedBox(
      height: 40,
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        inputFormatters: [CurrencyFormatter()],
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Color(0xFF105C46),
        ),
        decoration: InputDecoration(
          prefixText: "Rp. ",
          prefixStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF105C46),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
