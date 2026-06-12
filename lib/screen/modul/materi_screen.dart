import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class MateriScreen extends StatelessWidget {
  final String bab;
  final String title;
  final String contentHtml;

  const MateriScreen({
    super.key,
    required this.bab,
    required this.title,
    required this.contentHtml,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClean,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 20,
                bottom: 14,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(12, 8, 2, 8),
                      decoration: BoxDecoration(
                        color: AppColors.darkGreen,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.textLight,
                        size: 23,
                      ),
                    ),
                  ),

                  Text(
                    "Modul Pembelajaran",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textLight,
                    ),
                  ),
                  Image.asset('assets/images/logo_white.png', width: 40),
                ],
              ),
            ),

            const SizedBox(height: 5),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: HtmlWidget(
                  contentHtml,
                  textStyle: const TextStyle(
                    fontSize: 14,
                    height: 1.3,
                    color: AppColors.textDark,
                  ),
                  customStylesBuilder: (element) {
                    if (element.classes.contains('title')) {
                      return {'font-size': '17px', 'font-weight': '600'};
                    }
                    if (element.localName == 'table') {
                      return {'width': '100%', 'border-collapse': 'collapse'};
                    }

                    if (element.localName == 'td' ||
                        element.localName == 'th') {
                      return {
                        'border': '1px solid ${AppColors.primaryGreen}',
                        'vertical-align': 'top',
                      };
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
