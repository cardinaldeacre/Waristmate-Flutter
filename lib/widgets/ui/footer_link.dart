import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class FooterLink extends StatelessWidget {
  final String text;

  const FooterLink({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: AppColors.primaryGreen,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
