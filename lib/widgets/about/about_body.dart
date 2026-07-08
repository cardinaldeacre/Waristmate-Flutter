import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/about/about_header.dart';
import 'package:waristmate_app/widgets/ui/build_card.dart';
import 'package:waristmate_app/widgets/ui/feature_item.dart';
import 'package:waristmate_app/widgets/ui/info_row.dart';
import 'package:waristmate_app/widgets/ui/section_titles.dart';
import 'package:waristmate_app/core/config/app_info.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutBody extends StatefulWidget {
  const AboutBody({super.key});

  @override
  State<AboutBody> createState() => _AboutBodyState();
}

class _AboutBodyState extends State<AboutBody> {
  PackageInfo? packageInfo;

  @override
  void initState() {
    super.initState();
    loadPackageInfo();
  }

  Future<void> loadPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (packageInfo == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      physics: const BouncingScrollPhysics(),
      children: [
        AboutHeader(),

        const SizedBox(height: 32),

        const SectionTitles(title: 'Tentang Aplikasi'),

        BuildCard(
          child: const Text(
            'Waristmate adalah aplikasi inovatif yang dirancang untuk membantu umat Islam dalam mempelajari dan menghitung pembagian harta warisan (Faraidh) secara akurat sesuai dengan syariat Islam.',
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: AppColors.textLight,
            ),
            textAlign: TextAlign.justify,
          ),
        ),

        const SizedBox(height: 24),

        const SectionTitles(title: 'Fitur Utama'),

        BuildCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              FeatureItem(
                icon: Icons.calculate_rounded,
                title: 'Kalkulator Waris',
              ),
              const Divider(height: 1),
              FeatureItem(icon: Icons.edit_document, title: 'Catatan Harta'),
              const Divider(height: 1),
              FeatureItem(
                icon: Icons.menu_book_rounded,
                title: 'Modul Pembelajaran',
              ),
              const Divider(height: 1),
              FeatureItem(
                icon: Icons.cloud_sync_rounded,
                title: 'Sinkronisasi Cloud',
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        const SectionTitles(title: 'Informasi Aplikasi'),

        BuildCard(
          child: Column(
            children: [
              InfoRow(label: 'Versi', value: packageInfo!.version),
              const SizedBox(height: 8),
              InfoRow(label: 'Build', value: packageInfo!.buildNumber),
              // const SizedBox(height: 8),
              // InfoRow(label: 'Tanggal Rilis', value: '8 Juli 2026'),
              const SizedBox(height: 8),
              InfoRow(label: 'Update Terakhir', value: AppInfo.buildDate),
            ],
          ),
        ),

        const SizedBox(height: 24),

        const SectionTitles(title: 'Disclaimer'),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.orange.shade200),
          ),
          child: const Text(
            'Hasil perhitungan bersifat bantuan dan tidak menggantikan konsultasi langsung kepada ustadz atau ahli waris / faraidh.',
            style: TextStyle(
              fontSize: 13,
              color: Colors.deepOrange,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        const SizedBox(height: 32),

        const Text(
          'Terima kasih telah menggunakan Waristmate',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.primaryGreen,
          ),
        ),

        const SizedBox(height: 32),

        const Text(
          '© 2026 Waristmate',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
