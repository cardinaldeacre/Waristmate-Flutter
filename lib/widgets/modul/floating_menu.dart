import 'package:flutter/material.dart';
import 'package:waristmate_app/widgets/ui/circle_button.dart';

class FloatingMenu extends StatelessWidget {
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  final VoidCallback onMenu;
  final VoidCallback onRotate;
  final VoidCallback onFontSize;

  const FloatingMenu({
    super.key,
    this.onPrevious,
    this.onNext,
    required this.onMenu,
    required this.onRotate,
    required this.onFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width < 360 ? 8 : 26,
          vertical: 36,
        ),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleButton(
              icon: Icons.keyboard_arrow_left_rounded,
              onTap: onPrevious,
            ),
            CircleButton(icon: Icons.font_download_outlined, onTap: onFontSize),
            CircleButton(icon: Icons.menu_rounded, onTap: onMenu),
            CircleButton(icon: Icons.screen_rotation, onTap: onRotate),
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
