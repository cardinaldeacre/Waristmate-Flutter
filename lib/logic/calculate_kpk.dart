part of 'main_calculator.dart';

extension CalculateKPK on CalculatorController {
  void calculateKPK() {
    if (masalah.isEmpty) return;

    hasilKPK = masalah.reduce((a, b) => (a ~/ gcd(a, b)) * b);
  }

  int gcd(int a, int b) {
    if (b == 0) return a;

    return gcd(b, a % b);
  }
}
