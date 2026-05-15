import 'package:waristmate_app/controllers/calculator_controller.dart';
part 'calculate_special.dart';
part 'calculate_masalah.dart';
part 'calculate_kpk.dart';
part 'calculate_ratio.dart';

extension MainCalculator on CalculatorController {
  void startCounting() {
    masalah.clear();
    results.clear();

    if (isCalculateSpecial()) {
      return;
    }
  }
}
