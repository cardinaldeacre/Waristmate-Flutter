import 'package:waristmate_app/controllers/calculator_controller.dart';
part 'calculate_special.dart';
part 'calculate_masalah.dart';

extension MainCalculator on CalculatorController {
  void startCounting() {
    masalah.clear();
    results.clear();

    if (isCalculateSpecial()) {
      return;
    }
  }
}
