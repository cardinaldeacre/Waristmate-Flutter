import 'package:flutter/material.dart';

class CheckboxTile extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool?) onChanged;
  final double scale;

  const CheckboxTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.scale = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      alignment: Alignment.centerLeft,
      child: CheckboxListTile(
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
