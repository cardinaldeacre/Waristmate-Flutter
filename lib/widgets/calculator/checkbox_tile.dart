import 'package:flutter/material.dart';

class CheckboxTile extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool?) onChanged;
  final double scale;
  final bool isMahjub;
  final String? infoHajb;

  const CheckboxTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.scale = 1,
    this.isMahjub = false,
    this.infoHajb,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      alignment: Alignment.centerLeft,
      child: isMahjub
          ? Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red[400],
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: Colors.white70,
                    size: 17,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "$title Terhalang oleh $infoHajb",
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ],
              ),
            )
          : CheckboxListTile(
              title: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              value: value,
              checkboxShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              activeColor: Colors.white,
              checkColor: Colors.teal[600],
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              onChanged: onChanged,
            ),
    );
  }
}
