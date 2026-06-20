import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/profile/profile_header.dart';
import 'package:waristmate_app/widgets/profile/profile_card.dart';
import 'package:waristmate_app/widgets/profile/preference_card.dart';
import 'package:waristmate_app/widgets/profile/menu_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClean,
      body: SafeArea(
        child: Column(
          children: [
            ProfileHeader(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ProfileCard(),

                    const SizedBox(height: 16),

                    PreferenceCard(title: "Preferensi", child: Container()),

                    const SizedBox(height: 16),

                    MenuCard(
                      title: "Riwayat Aktivitas",
                      subtitle: "Terakhir diperbarui: 12 Juni 2024",
                      iconData: Icons.history,
                    ),

                    const SizedBox(height: 16),

                    MenuCard(
                      title: "Tentang Waristmate",
                      subtitle: "Cari tahu lebih lanjut tentang aplikasi ini",
                      iconData: Icons.info,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
