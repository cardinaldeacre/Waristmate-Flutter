import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:html/dom.dart' as dom;
import 'dart:math';
import 'package:waristmate_app/core/utils/html_utils.dart';

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
    final List<List<String>> tableData = [];
    for (final row in tableElement.getElementsByTagName('tr')) {
      final cells = row.getElementsByTagName('td');
      if (cells.isNotEmpty) {
        tableData.add(
          cells.map((cell) => HtmlUtils.cleanText(cell.text)).toList(),
        );
      }
    }

    final columnCount = tableData.first.length;
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
                  for (int i = 0; i < columnCount; i++)
                    i: const IntrinsicColumnWidth(),
                },
                children: tableData.map((data) {
                  return TableRow(
                    children: data
                        .map((cell) => _buildTableCell(cell))
                        .toList(),
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
