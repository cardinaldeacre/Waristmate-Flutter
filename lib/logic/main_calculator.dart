import 'package:waristmate_app/controllers/calculator_controller.dart';
part 'calculate_special.dart';
part 'calculate_masalah.dart';
part 'calculate_kpk.dart';
part 'calculate_ratio.dart';
part 'calculate_ratio2.dart';
part 'calculate_aul_radd.dart';
part 'calculate_radd_pasutri.dart';
part 'calculate_ashabah.dart';
part 'calculate_share.dart';

extension MainCalculator on CalculatorController {
  void startCounting() {
    masalah.clear();
    results.clear();
    hasilKPK = 0;
    totalRatio = 0;
    kasus = '';
    totalWarisan = nIrst;
    sisaWarisan = totalWarisan;

    if (isCalculateSpecial()) {
      return;
    }

    calculateMasalah();

    return;
  }
}
