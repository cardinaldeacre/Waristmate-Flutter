import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:waristmate_app/controllers/auth_controller.dart';
import 'package:waristmate_app/controllers/materi_controller.dart';
import 'package:waristmate_app/controllers/modul_controller.dart';
import 'package:waristmate_app/controllers/personal_note_controller.dart';
import 'package:waristmate_app/core/config/auth_config.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';
import 'package:waristmate_app/screen/welcome/welcome_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Hive.initFlutter();
  await Hive.openBox('materiBox');
  await Hive.openBox('profileBox');
  await Hive.openBox('personalNoteBox');
  await Hive.openBox('personalDraftBox');
  await Hive.openBox('calculationHistoryBox');
  await Hive.openBox('progressBox');

  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    publishableKey: dotenv.env['SUPABASE_PUBLISHABLE_KEY']!,
  );
  await GoogleSignIn.instance.initialize(
    serverClientId: AuthConfig.clientIdForPlatform,
  );

  await Future.delayed(Duration(seconds: 3));

  final view = WidgetsBinding.instance.platformDispatcher.views.first;
  final display = view.display;

  final logicalWidth = display.size.width / display.devicePixelRatio;
  final logicalHeight = display.size.height / display.devicePixelRatio;

  final shortestSide = logicalWidth < logicalHeight
      ? logicalWidth
      : logicalHeight;

  final isTablet = shortestSide >= 600;

  if (isTablet) {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  } else {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthController()),
        ChangeNotifierProvider(create: (context) => CalculatorController()),
        ChangeNotifierProvider(create: (context) => PersonalNoteController()),
        ChangeNotifierProvider(create: (context) => ModulController()),
        ChangeNotifierProvider(create: (context) => MateriController()),
      ],
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
      builder: (context, child) {
        final media = MediaQuery.of(context);

        return MediaQuery(
          data: media.copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
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
      home: const WelcomeScreen(),
    );
  }
}
