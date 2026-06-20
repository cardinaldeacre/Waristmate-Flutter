import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String avatarUrl;
  final bool isLoggedIn;
  final VoidCallback? onEdit;

  const ProfileCard({
    super.key,
    required this.name,
    required this.avatarUrl,
    required this.isLoggedIn,
    this.onEdit,
  });

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
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: CircleAvatar(
                  radius: 56,
                  backgroundImage: NetworkImage(avatarUrl),
                  backgroundColor: AppColors.darkGreen,
                ),
              ),

              if (isLoggedIn)
                Container(
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.edit, size: 20),
                    color: Colors.white,
                    onPressed: onEdit,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),

          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
