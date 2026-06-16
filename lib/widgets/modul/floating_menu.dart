import 'package:flutter/material.dart';
import 'package:waristmate_app/widgets/ui/circle_button.dart';

class FloatingMenu extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onMenu;

  const FloatingMenu({
    super.key,
    required this.onPrevious,
    required this.onNext,
    required this.onMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleButton(
              icon: Icons.keyboard_arrow_left_rounded,
              onTap: onPrevious,
            ),
            CircleButton(icon: Icons.menu_rounded, onTap: onMenu),
            CircleButton(
              icon: Icons.keyboard_arrow_right_rounded,
              onTap: onNext,
            ),
          ],
        ),
      ),
    );
  }
}
