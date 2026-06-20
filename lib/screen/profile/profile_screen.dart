import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/profile/profile_header.dart';
import 'package:waristmate_app/widgets/profile/profile_card.dart';
import 'package:waristmate_app/widgets/profile/preference_card.dart';
import 'package:waristmate_app/widgets/profile/menu_card.dart';
import 'package:waristmate_app/widgets/profile/logout_card.dart';
import 'package:waristmate_app/widgets/profile/login_card.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:async';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? _user;

  late final StreamSubscription<AuthState> _authSubscription;

  @override
  void initState() {
    super.initState();
    _user = Supabase.instance.client.auth.currentUser;

    _authSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((
      data,
    ) {
      setState(() {
        _user = data.session?.user;
      });
    });
  }

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = _user != null;

    final userName = isLoggedIn
        ? (_user?.userMetadata?['full_name'] ?? "User Waristmate")
        : "Fulan bin Fulan";

    final userAvatar = isLoggedIn
        ? (_user?.userMetadata?['avatar_url'] ??
              "https://ui-avatars.com/api/?name=$userName&background=105C46&color=fff")
        : "https://ui-avatars.com/api/?name=Fulan&background=cccccc&color=fff";

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
                    if (isLoggedIn)
                      ProfileCard(
                        name: userName,
                        avatarUrl: userAvatar,
                        isLoggedIn: isLoggedIn,
                        onEdit: () {
                          print("Edit profile tapped");
                        },
                      )
                    else
                      LoginCard(),

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

                    const SizedBox(height: 16),

                    if (isLoggedIn) LogoutCard(),
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
