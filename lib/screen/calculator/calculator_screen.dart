import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'step1.dart';
import 'step2.dart';
import 'step3.dart';
import 'step4.dart';
import 'step5.dart';
import 'step6.dart';
import 'step7.dart';
import 'step8.dart';
import 'step9.dart';
import 'calculation_result.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final PageController _pageController = PageController();

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _prevPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _home() {
    Provider.of<CalculatorController>(context, listen: false).resetData();

    _pageController.jumpToPage(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Step1(onNext: _nextPage),
          Step2(onNext: _nextPage, onBack: _prevPage),
          Step3(onNext: _nextPage, onBack: _prevPage),
          Step4(onNext: _nextPage, onBack: _prevPage),
          Step5(onNext: _nextPage, onBack: _prevPage),
          Step6(onNext: _nextPage, onBack: _prevPage),
          Step7(onNext: _nextPage, onBack: _prevPage),
          Step8(onNext: _nextPage, onBack: _prevPage),
          Step9(onNext: _nextPage, onBack: _prevPage),
          CalculationResult(onBack: _prevPage, onHome: _home),
        ],
      ),
    );
  }
}
