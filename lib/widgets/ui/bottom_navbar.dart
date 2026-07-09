import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class NavigationItem {
  final String label;
  final String icon;

  const NavigationItem({required this.label, required this.icon});
}

class BottomNavbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const List<NavigationItem> items = [
    NavigationItem(label: 'Kalkulator', icon: 'assets/icons/ic_calculate.png'),
    NavigationItem(label: 'Modul', icon: 'assets/icons/ic_book.png'),
    NavigationItem(label: 'Beranda', icon: 'assets/icons/ic_home.png'),
    NavigationItem(label: 'Catatan', icon: 'assets/icons/ic_server_person.png'),
    NavigationItem(label: 'Profil', icon: 'assets/icons/ic_person.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.darkGreen,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: List.generate(items.length, (index) {
            final selected = currentIndex == index;
            final item = items[index];

            return Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => onTap(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: selected
                        ? AppColors.cardBackground.withAlpha(38)
                        : AppColors.darkShadow.withAlpha(10),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 200),
                    scale: selected ? 1.15 : 1,
                    child: ImageIcon(
                      AssetImage(item.icon),
                      color: selected
                          ? AppColors.textLight
                          : AppColors.textLight.withAlpha(150),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
