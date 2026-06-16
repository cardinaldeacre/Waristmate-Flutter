import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:html/dom.dart' as dom;

class NativeFlutterTable extends StatelessWidget {
  final dom.Element tableElement;

  const NativeFlutterTable({super.key, required this.tableElement});

  @override
  Widget build(BuildContext context) {
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
