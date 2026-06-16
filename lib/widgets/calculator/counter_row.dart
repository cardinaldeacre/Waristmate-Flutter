import 'package:flutter/material.dart';
import 'package:waristmate_app/widgets/custom_thumb_shape.dart';
import 'package:waristmate_app/widgets/ui/container_border.dart';

class CounterRow extends StatelessWidget {
  final String label;
  final int value;
  final Function(int) onChanged;
  final int max;

  const CounterRow({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.max = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label ($value)",
          style: const TextStyle(
            fontSize: 17.5,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ContainerBorder(
              size: 30,
              borderRadius: 10,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: value > 0 ? () => onChanged(value - 1) : null,
                child: const Center(
                  child: Icon(Icons.remove, color: Colors.white, size: 17.5),
                ),
              ),
            ),
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 17.5,
                  thumbShape: CustomThumbShape(),
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.white24,
                  thumbColor: Colors.white,
                  overlayColor: Colors.white12,
                ),
                child: Slider(
                  value: value.toDouble(),
                  min: 0,
                  max: max.toDouble(),
                  onChanged: (double newValue) {
                    onChanged(newValue.toInt());
                  },
                ),
              ),
            ),
            ContainerBorder(
              size: 30,
              borderRadius: 10,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: value < max ? () => onChanged(value + 1) : null,
                child: const Center(
                  child: Icon(Icons.add, color: Colors.white, size: 17.5),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
