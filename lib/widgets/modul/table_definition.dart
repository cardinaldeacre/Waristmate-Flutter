import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:html/dom.dart' as dom;
import 'package:waristmate_app/core/config/theme.dart';

class TableDefinition extends StatelessWidget {
  final dom.Element tableElement;
  final double fontSize;

  const TableDefinition({
    super.key,
    required this.tableElement,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasBorder = tableElement.classes.contains('table-border');
    return Scrollbar(
      radius: const Radius.circular(8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Html(
            data: tableElement.outerHtml,
            extensions: [TableHtmlExtension()],
            style: {
              ".table-wrapper": Style(alignment: Alignment.center),
              ".table-center": Style(textAlign: TextAlign.center),
              ".orange": Style(color: AppColors.orange),
              'table': Style(
                border: hasBorder
                    ? Border.all(color: AppColors.primaryGreen, width: 1)
                    : Border(
                        bottom: BorderSide(color: AppColors.grey, width: 1),
                      ),
                margin: Margins.zero,
              ),
              'td': Style(
                padding: HtmlPaddings.symmetric(vertical: 4, horizontal: 6),
                border: hasBorder
                    ? Border.all(color: AppColors.primaryGreen, width: 1)
                    : Border(
                        bottom: BorderSide(color: AppColors.grey, width: 1),
                      ),
                margin: Margins.zero,
                fontSize: FontSize(fontSize),
                color: AppColors.textDark,
                verticalAlign: VerticalAlign.middle,
              ),
            },
          ),
        ),
      ),
    );
  }
}
