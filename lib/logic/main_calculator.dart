import 'package:flutter/material.dart';
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
    hasilKPK = 0;
    totalRatio = 0;
    kasus = '';
    totalWarisan = nIrst;
    sisaWarisan = totalWarisan;
    totalAshabah = 0;
    nominalAshabah = 0;

    debugPrint('Starting calculation...');

    if (isCalculateSpecial()) {
      return;
    }

    calculateMasalah();

    return;
  }
}
