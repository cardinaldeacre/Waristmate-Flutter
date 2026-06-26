import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:html/dom.dart' as dom;
import 'dart:math';

class NativeFlutterTable extends StatelessWidget {
  final dom.Element tableElement;
  final double fontSize;

  const NativeFlutterTable({
    super.key,
    required this.tableElement,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final String headerTitle =
        tableElement.previousElementSibling?.localName == 'h3' ||
            tableElement.previousElementSibling?.localName == 'h2'
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

    final double screenWidth = MediaQuery.of(context).size.width - 32;
    final double finalTableWidth = max(screenWidth, fontSize * 70);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Scrollbar(
          radius: const Radius.circular(8),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              width: finalTableWidth,
              child: Table(
                border: TableBorder(
                  horizontalInside: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.0,
                  ),
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1.0),
                ),
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(0.2),
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
            ),
          ),
        ),
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
          fontSize: fontSize,
          fontWeight: isKey ? FontWeight.bold : FontWeight.normal,
          color: isSeparator ? AppColors.primaryGreen : AppColors.textDark,
        ),
      ),
    );
  }
}
