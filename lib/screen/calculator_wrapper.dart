import 'package:flutter/material.dart';
import 'calculator/step1.dart';
import 'calculator/step2.dart';
import 'calculator/step3.dart';
import 'calculator/step4.dart';
import 'calculator/step5.dart';
import 'calculator/step6.dart';
import 'calculator/step7.dart';
import 'calculator/step8.dart';

class CalculatorWrapper extends StatefulWidget {
  const CalculatorWrapper({super.key});

  @override
  State<CalculatorWrapper> createState() => _CalculatorWrapperState();
}

class _CalculatorWrapperState extends State<CalculatorWrapper> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: PageView(
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
          ],
        ),
      ),
    );
  }
}
