import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/screen/about/about_screen.dart';
import 'package:waristmate_app/widgets/profile/profile_header.dart';
import 'package:waristmate_app/widgets/profile/profile_card.dart';
import 'package:waristmate_app/widgets/profile/preference_card.dart';
import 'package:waristmate_app/widgets/profile/menu_card.dart';
import 'package:waristmate_app/widgets/profile/logout_card.dart';
import 'package:waristmate_app/widgets/profile/login_card.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> linkToUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Gagal membuka URL: $url';
    }
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
      extendBodyBehindAppBar: true,
      body: Column(
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
                    )
                  else
                    LoginCard(),

                  const SizedBox(height: 16),

                  PreferenceCard(title: "Preferensi", child: Container()),

                  const SizedBox(height: 16),

                  MenuCard(
                    title: "Tentang Waristmate",
                    subtitle: "Cari tahu lebih lanjut tentang aplikasi ini",
                    iconData: Icons.info,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  MenuCard(
                    title: "Beri Masukan",
                    subtitle: "Bantu kami meningkatkan aplikasi ini",
                    iconData: Icons.feedback,
                    onTap: () {
                      linkToUrl("https://forms.gle/EEYZNr4hkQxWvBjL9");
                    },
                  ),

                  const SizedBox(height: 16),

                  if (isLoggedIn) LogoutCard(),

                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
