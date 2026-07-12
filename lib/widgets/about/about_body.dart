import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/about/about_header.dart';
import 'package:waristmate_app/widgets/ui/build_card.dart';
import 'package:waristmate_app/widgets/ui/feature_item.dart';
import 'package:waristmate_app/widgets/ui/info_row.dart';
import 'package:waristmate_app/widgets/ui/section_item.dart';
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
              const Divider(height: 1, color: AppColors.grey),
              FeatureItem(icon: Icons.edit_document, title: 'Catatan Harta'),
              const Divider(height: 1, color: AppColors.grey),
              FeatureItem(
                icon: Icons.menu_book_rounded,
                title: 'Modul Pembelajaran',
              ),
              const Divider(height: 1, color: AppColors.grey),
              FeatureItem(
                icon: Icons.cloud_sync_rounded,
                title: 'Sinkronisasi Cloud',
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        const SectionTitles(title: 'Para Kreator'),

        BuildCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              SectionItem(
                name: 'Iqbal Maulana',
                title: 'Developer Aplikasi',
                description:
                    'Sang kreator di balik Waristmate, menggabungkan keahlian teknis dan pemahaman syariat untuk menciptakan pengalaman pengguna yang mulus',
              ),
              const Divider(
                height: 0,
                thickness: 4,
                indent: 8,
                endIndent: 8,
                color: AppColors.grey,
              ),
              SectionItem(
                name: 'Indah Puspita Sari, S.P., M.E., C.Med.',
                title: 'Ahli Faraidh',
                description:
                    'Direktur CMS (Centre of Mawarith Studies), memberikan panduan syariat yang akurat untuk memastikan aplikasi ini sesuai dengan prinsip-prinsip Islam.',
              ),
              const Divider(
                height: 0,
                thickness: 4,
                indent: 8,
                endIndent: 8,
                color: AppColors.grey,
              ),
              SectionItem(
                name: 'Aziz Musthafa, S.Kom, M.T.',
                title: 'Dosen Pembimbing',
                description:
                    'Dosen pembimbing yang memberikan arahan dan dukungan serta wawasan berharga selama pengembangan aplikasi, memastikan kualitas dan keberlanjutan proyek.',
              ),
              const Divider(
                height: 0,
                thickness: 4,
                indent: 8,
                endIndent: 8,
                color: AppColors.grey,
              ),
              SectionItem(
                name: 'Dihin Muriyatmoko, S.ST., M.T.',
                title: 'Dosen Pembimbing',
                description:
                    'Dosen pembimbing dan pengajar yang memberikan bimbingan akademik selama pengembangan aplikasi, memastikan kesesuaian dengan standar pendidikan tinggi.',
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        const SectionTitles(title: 'Referensi Utama'),

        BuildCard(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/buku_kmi.png',
                  height: 400,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 8),
                Text(
                  'Buku `Ilmu-l-Faraidh',
                  style: TextStyle(fontSize: 14, color: AppColors.textLight),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'KMI Gontor',
                  style: TextStyle(fontSize: 14, color: AppColors.textLight),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
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

        BuildCard(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 8),
                const Image(
                  image: AssetImage('assets/images/logo_unida.png'),
                  height: 48,
                ),
                const Image(
                  image: AssetImage('assets/images/logo_saintek.png'),
                  height: 48,
                ),
                const Image(
                  image: AssetImage('assets/images/logo_ti.png'),
                  height: 44,
                ),
                const Image(
                  image: AssetImage('assets/images/logo_cms.png'),
                  height: 48,
                ),
                const SizedBox(width: 8),
              ],
            ),
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
