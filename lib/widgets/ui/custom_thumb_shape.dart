import 'package:flutter/material.dart';

class CustomThumbShape extends SliderComponentShape {
  const CustomThumbShape();

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(30, 30);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    // outline putih
    final Paint borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // isi hijau
    final Paint fillPaint = Paint()
      ..color = Colors.teal[700]!
      ..style = PaintingStyle.fill;

    // gambar lingkaran isi
    canvas.drawCircle(center, 14, fillPaint);

    // gambar border
    canvas.drawCircle(center, 14, borderPaint);
  }
}
