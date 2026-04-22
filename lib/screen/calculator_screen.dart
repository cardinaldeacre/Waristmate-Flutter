import 'package:flutter/material.dart';
import 'package:waristmate_app/logic/simple_inheritance.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _hartaController = TextEditingController();
  bool _adaIstri = false;
  int _jmlAnakLaki = 0;
  Map<String, double> _hasilHitung = {};

  void _eksekusiHitung() {
    double nominal = double.tryParse((_hartaController.text)) ?? 0;

    final res = SimpleInheritance.hitungSederhana(
      nominal,
      _adaIstri,
      _jmlAnakLaki,
    );

    setState(() {
      _hasilHitung = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator Waris Sederhana')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _hartaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Total Harta Warisan",
                prefixText: "Rp ",
                border: OutlineInputBorder(),
              ),
            ),
            CheckboxListTile(
              title: const Text("Ada Istri?"),
              value: _adaIstri,
              onChanged: (value) {
                setState(() {
                  _adaIstri = (value) ?? false;
                });
              },
            ),
            const Text("Jumlah anak laki-laki:"),
            Slider(
              value: _jmlAnakLaki.toDouble(),
              min: 0,
              max: 10,
              divisions: 10,
              label: _jmlAnakLaki.toString(),
              onChanged: (val) => setState(() => _jmlAnakLaki = val.toInt()),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _eksekusiHitung,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Hitung"),
            ),
            const Divider(height: 40),
            Expanded(
              child: ListView(
                children: _hasilHitung.entries.map((entry) {
                  return Card(
                    child: ListTile(
                      title: Text(entry.key),
                      trailing: Text("Rp ${entry.value.toStringAsFixed(0)}"),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
