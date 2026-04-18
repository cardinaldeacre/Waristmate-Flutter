import 'package:flutter/material.dart';
import 'screen/calculator_screen.dart';

void main() {
  runApp(const WaristmateApp());
}

class WaristmateApp extends StatelessWidget {
  const WaristmateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WARISTMATE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.white,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.white,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: const CalculatorScreen(),
    );
  }
}
