import 'package:flutter/material.dart';
import 'package:waristmate_app/screen/calculator/step2.dart';
import 'calculator/step1.dart';

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
            // Step3(onBack: _prevPage),
          ],
        ),
      ),
    );
  }
}
