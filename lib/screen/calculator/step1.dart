import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../controllers/calculator_controller.dart';

class Step1 extends StatelessWidget {
  final VoidCallback onNext;

  const Step1({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<CalculatorController>(context);

    const Color primaryGreen = Color(0xFF157B5D);
    const Color darkGreen = Color(0xFF105C46);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
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
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: primaryGreen,
                ),
              ),
              Image.asset('assets/images/logo_white.png', width: 40),
            ],
          ),
          const SizedBox(height: 20),

          // main card
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                top: 20,
                left: 15,
                right: 15,
                bottom: 100,
              ),
              height: 100,
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
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 6),

                    // input harta
                    _buildInputLabel("Harta yang ditinggalkan"),
                    _buildTextField(
                      onChanged: (val) =>
                          calc.updateTirkah(double.tryParse(val) ?? 0),
                    ),

                    const SizedBox(height: 6),
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
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 20),

                          Radio<String>(
                            value: 'Perempuan',
                            fillColor: WidgetStateProperty.all(Colors.white),
                          ),
                          const Text(
                            "Perempuan",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),

                    _buildInputLabel("Biaya pengurusan jenazah"),
                    _buildTextField(
                      onChanged: (val) =>
                          calc.updateTajhiz(double.tryParse(val) ?? 0),
                    ),

                    _buildInputLabel("Hutang dari muwarrits"),
                    _buildTextField(
                      onChanged: (val) =>
                          calc.updateHutang(double.tryParse(val) ?? 0),
                    ),

                    _buildInputLabel("Wasiat (maksimal 1/3 harta)"),
                    _buildTextField(
                      onChanged: (val) =>
                          calc.updateWasiat(double.tryParse(val) ?? 0),
                    ),

                    _buildInputLabel("Sisa harta yang diwariskan (Irts)"),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
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

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: null,
                  child: const Text(
                    "Kembali",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: onNext,
                  child: const Text(
                    "Selanjutnya",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTextField({required Function(String) onChanged}) {
    return TextField(
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF105C46),
      ),
      decoration: InputDecoration(
        prefixText: "Rp. ",
        prefixStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF105C46),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
