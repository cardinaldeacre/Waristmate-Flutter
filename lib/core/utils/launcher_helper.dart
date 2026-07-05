import 'package:url_launcher/url_launcher.dart';

class LauncherHelper {
  LauncherHelper._();

  static Future<void> openWhatsApp() async {
    final message = Uri.encodeComponent(
      'Assalamu\'alaikum.\nSaya menggunakan aplikasi WaristMate dan ingin berkonsultasi mengenai pembagian warisan.',
    );

    final Uri url = Uri.parse('https://wa.me/6281323111004?text=$message');

    await launchUrl(url, mode: LaunchMode.externalApplication);
  }
}
