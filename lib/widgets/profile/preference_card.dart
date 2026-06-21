import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/profile/font_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceCard extends StatefulWidget {
  final String title;
  final Widget child;

  const PreferenceCard({super.key, required this.title, required this.child});

  @override
  State<PreferenceCard> createState() => _PreferenceCardState();
}

class _PreferenceCardState extends State<PreferenceCard> {
  double _latinTextSize = 15.0;
  double _arabicTextSize = 28.0;

  SharedPreferences? _prefs;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _latinTextSize = _prefs!.getDouble('latin_text_size') ?? 15.0;
      _arabicTextSize = _prefs!.getDouble('arabic_text_size') ?? 28.0;
    });
  }

  Future<void> _savePreferences(String key, double value) async {
    if (_prefs != null) {
      await _prefs!.setDouble(key, value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              color: AppColors.textLight,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          widget.child,

          const Divider(height: 1, color: Colors.white24),
          FontSlider(
            title: "Ukuran Teks Latin",
            iconData: Icons.text_format_rounded,
            value: _latinTextSize,
            min: 12,
            max: 24,
            onChanged: (value) {
              setState(() {
                _latinTextSize = value;
              });
              _savePreferences('latin_text_size', value);
            },
          ),

          const Divider(height: 1, color: Colors.white24),

          FontSlider(
            title: "Ukuran Teks Arab",
            iconData: Icons.text_format_rounded,
            value: _arabicTextSize,
            min: 20,
            max: 32,
            onChanged: (value) {
              setState(() {
                _arabicTextSize = value;
              });
              _savePreferences('arabic_text_size', value);
            },
          ),

          const Divider(height: 1, color: Colors.white24),
        ],
      ),
    );
  }
}
