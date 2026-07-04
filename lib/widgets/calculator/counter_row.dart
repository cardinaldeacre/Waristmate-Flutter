import 'package:flutter/material.dart';
import 'package:waristmate_app/widgets/ui/custom_thumb_shape.dart';
import 'package:waristmate_app/widgets/ui/container_border.dart';

class CounterRow extends StatelessWidget {
  final String label;
  final int value;
  final Function(int) onChanged;
  final int max;
  final bool? isMahjub;
  final String? infoHajb;

  const CounterRow({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.max = 50,
    this.isMahjub = false,
    this.infoHajb = "",
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

        if (isMahjub == true)
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.red[400],
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: Colors.white70, size: 17),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Terhalang oleh $infoHajb",
                    style: const TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ],
            ),
          )
        else
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
