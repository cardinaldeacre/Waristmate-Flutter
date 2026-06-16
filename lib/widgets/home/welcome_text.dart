import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Assalamu'alaikum,",
              style: TextStyle(
                color: AppColors.darkGreen,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
            const Text(
              "Selamat Datang!",
              style: TextStyle(
                color: AppColors.darkGreen,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
