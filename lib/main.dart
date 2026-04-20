import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';
import 'screen/calculator_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CalculatorController(),
      child: const WaristmateApp(),
    ),
  );
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
