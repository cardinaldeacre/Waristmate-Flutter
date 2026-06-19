import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';
import 'screen/main_wrapper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Hive.initFlutter();
  await Hive.openBox('materiBox');

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    publishableKey: dotenv.env['SUPABASE_PUBLISHABLE_KEY']!,
  );

  await Future.delayed(Duration(seconds: 3));
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
