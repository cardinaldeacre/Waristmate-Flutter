import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/screen/profile/edit_profile_screen.dart';
import 'dart:io';

import 'package:waristmate_app/services/profile/user_profile_service.dart';


class ProfileCard extends StatelessWidget {
  final String name;
  final String avatarUrl;
  final bool isLoggedIn;

  final UserProfileService profileService = UserProfileService();

  ProfileCard({
    super.key,
    required this.name,
    required this.avatarUrl,
    required this.isLoggedIn,
  });

  ImageProvider getAvatarImage() {
    final localPath = profileService.getLocalAvatarPath();

    if (localPath != null && localPath.isNotEmpty) {
      final file = File(localPath);
      if (file.existsSync()) {
        return FileImage(file);
      }
    }

    if (avatarUrl.isNotEmpty) {
      return NetworkImage(avatarUrl);
    }

    return const AssetImage('assets/images/user.png');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(26),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.textLight, width: 4),
                ),
                child: CircleAvatar(
                  radius: 56,
                  backgroundImage: getAvatarImage(),
                  backgroundColor: AppColors.darkGreen,
                ),
              ),
              if (isLoggedIn)
                Container(
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.textLight, width: 2),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.settings, size: 20),
                    color: AppColors.textLight,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfileScreen(initialName: name, avatarUrl: avatarUrl)),
                      );
                    },
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
              color: AppColors.textLight,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
