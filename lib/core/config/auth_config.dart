import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthConfig {
  static String get supabaseUrl => dotenv.env['SUPABASE_URL']!;
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY']!;

  static String? get webClientId => dotenv.env['GOOGLE_WEB_CLIENT_ID'];
  static String? get iosClientId => dotenv.env['GOOGLE_IOS_CLIENT_ID'];

  static String? get clientIdForPlatform {
    if (kIsWeb) {
      return webClientId;
    } else if (Platform.isIOS) {
      return iosClientId;
    } else if (Platform.isAndroid) {
      return webClientId;
    } else {
      return null;
    }
  }
}
