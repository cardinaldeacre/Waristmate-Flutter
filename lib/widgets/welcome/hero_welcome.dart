import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/core/extension/context_extension.dart';

class HeroWelcome extends StatelessWidget {
  const HeroWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSmall = context.isSmallScreen;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: isSmall ? 60 : 80),
        Stack(
          clipBehavior: Clip.none,

          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/balance_3d.png',
              height: isSmall ? 240 : 280,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.balance_rounded, size: 160, color: AppColors.gold),
            ),
            Positioned(
              top: 35,
              right: -5,
              child: Image.asset('assets/images/3d_coin.png', width: 45),
            ),

            Positioned(
              top: 70,
              left: -20,
              child: Transform.flip(
                flipX: true,
                child: Image.asset('assets/images/3d_coin.png', width: 45),
              ),
            ),

            Positioned(
              bottom: 10,
              left: 20,
              child: Transform.flip(
                flipX: true,
                flipY: true,
                child: Image.asset('assets/images/3d_coin.png', width: 45),
              ),
            ),

            Positioned(
              bottom: 45,
              right: 5,
              child: Image.asset('assets/images/3d_coin.png', width: 50),
            ),
          ],
        ),
        SizedBox(height: isSmall ? 20 : 30),
        const Text(
          'WARISTMATE',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: AppColors.textLight,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}
