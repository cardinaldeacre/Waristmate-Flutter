import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';
import 'screen/main_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

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
        colorSchemeSeed: AppColors.primaryGreen,
        fontFamily: 'Gabarito',
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: AppColors.primaryGreen,
        fontFamily: 'Gabarito',
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: const MainWrapper(),
    );
  }
}
