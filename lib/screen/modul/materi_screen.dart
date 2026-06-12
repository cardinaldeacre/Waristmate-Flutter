import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html/dom.dart' as dom;

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
                  customWidgetBuilder: (element) {
                    if (element.localName == 'table') {
                      return _buildNativeFlutterTable(context, element);
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

  Widget _buildNativeFlutterTable(
    BuildContext context,
    dom.Element tableElement,
  ) {
    final String headerTitle =
        tableElement.previousElementSibling?.localName == 'h3'
        ? tableElement.previousElementSibling!.text.trim()
        : '';

    final List<Map<String, String>> tableData = [];
    for (final row in tableElement.getElementsByTagName('tr')) {
      final cells = row.getElementsByTagName('td');
      if (cells.length == 3) {
        tableData.add({
          'key': cells[0].text.trim(),
          'separator': cells[1].text.trim(),
          'value': cells[2].text.trim(),
        });
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (headerTitle.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              headerTitle,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
          ),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: IntrinsicColumnWidth(),
              2: FlexColumnWidth(5),
            },
            children: tableData.map((data) {
              return TableRow(
                children: [
                  _buildTableCell(data['key']!, isKey: true),
                  _buildTableCell(data['separator']!, isSeparator: true),
                  _buildTableCell(data['value']!),
                ],
              );
            }).toList(),
          ),
        ],
      ],
    );
  }

  Widget _buildTableCell(
    String text, {
    bool isKey = false,
    bool isSeparator = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      child: Text(
        text,
        textAlign: isSeparator ? TextAlign.center : TextAlign.left,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isKey ? FontWeight.bold : FontWeight.normal,
          color: isSeparator ? AppColors.primaryGreen : AppColors.textDark,
        ),
      ),
    );
  }
}
