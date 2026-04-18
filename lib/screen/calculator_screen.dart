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
          ],
        ),
      ),
    );
  }
}
