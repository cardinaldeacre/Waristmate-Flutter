import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class TextHighlight {
  static List<TextSpan> build({
    required String text,
    required String keyword,
    TextStyle? style,
  }) {
    if (keyword.trim().isEmpty) {
      return [
        TextSpan(
          text: text,
          style: style ?? const TextStyle(color: AppColors.textDark),
        ),
      ];
    }
    final lowerText = text.toLowerCase();
    final lowerKeyword = keyword.toLowerCase();

    final spans = <TextSpan>[];

    int start = 0;
    int index;

    while (true) {
      index = lowerText.indexOf(lowerKeyword, start);
      if (index == -1) {
        spans.add(
          TextSpan(
            text: text.substring(start),
            style: style ?? const TextStyle(color: AppColors.textDark),
          ),
        );
        break;
      }

      if (index > start) {
        spans.add(
          TextSpan(
            text: text.substring(start, index),
            style: style ?? const TextStyle(color: AppColors.textDark),
          ),
        );
      }

      spans.add(
        TextSpan(
          text: text.substring(index, index + keyword.length),
          style: style?.copyWith(
            color: AppColors.secondaryGreen,
            backgroundColor: AppColors.lime.withAlpha(80),
            fontWeight: FontWeight.bold,
          ),
        ),
      );

      start = index + keyword.length;
    }

    return spans;
  }
}
