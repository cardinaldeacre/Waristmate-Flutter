import 'package:flutter/material.dart';
import 'calculator/step1.dart';

class CalculatrorWrapper extends StatefulWidget {
  const CalculatrorWrapper({super.key});

  @override
  State<CalculatrorWrapper> createState() => _CalculatrorWrapperState();
}

class _CalculatrorWrapperState extends State<CalculatrorWrapper> {
  final PageController _pageController = PageController();

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // void _prevPage() {
  //   _pageController.previousPage(
  //     duration: const Duration(milliseconds: 300),
  //     curve: Curves.easeInOut,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Step1(onNext: _nextPage),
            // Step2(onNext: _nextPage, onBack: _prevPage),
            // Step3(onBack: _prevPage),
          ],
        ),
      ),
    );
  }
}
