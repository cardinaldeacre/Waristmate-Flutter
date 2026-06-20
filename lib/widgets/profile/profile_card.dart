import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

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
                child: const CircleAvatar(
                  radius: 56,
                  backgroundImage: NetworkImage(
                    'https://ui-avatars.com/api/?name=Iqbal+Maulana&background=105C46&color=fff&size=128',
                  ),
                ),
              ),
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
                  onPressed: () {
                    print("Edit profile picture");
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          const Text(
            "Iqbal Maulana",
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
