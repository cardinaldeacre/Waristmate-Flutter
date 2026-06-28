import 'package:html/dom.dart' as dom;
import 'package:waristmate_app/core/utils/html_utils.dart';
import 'package:waristmate_app/models/share_table.dart';

class GenericTableParser {
  const GenericTableParser();

  ShareTableModel parse(dom.Element table) {
    final rows = table.getElementsByTagName('tr').toList();
    final heirs = <ShareHeir>[];

    int startRow = 0;
    final firstRowCells = rows[0].children
        .where((e) => e.localName == 'td' || e.localName == 'th')
        .toList();
    if (firstRowCells.any(
      (e) =>
          e.localName == 'th' ||
          (e.attributes['style'] ?? '').contains('font-weight'),
    )) {
      startRow = 1;
    }

    int rowIdx = startRow;
    while (rowIdx < rows.length) {
      final tr = rows[rowIdx];
      final tds = tr.children
          .where((e) => e.localName == 'td' || e.localName == 'th')
          .toList();

      if (tds.isEmpty) {
        rowIdx++;
        continue;
      }

      if (tds.length == 1 &&
          (int.tryParse(tds[0].attributes['colspan'] ?? '1') ?? 1) > 1) {
        // Ini baris catatan, tambah ke heir terakhir jika ada
        final note = HtmlUtils.cleanText(tds[0].text);
        if (heirs.isNotEmpty && note.isNotEmpty) {
          heirs.last.rules.add(ShareRule(condition: note, isNote: true));
        }
        rowIdx++;
        continue;
      }

      final rowspan = int.tryParse(tds[0].attributes['rowspan'] ?? '1') ?? 1;

      if (rowspan > 1) {
        // Baris pertama ahli waris — punya No, Nama, Bagian, Keadaan
        final number = HtmlUtils.cleanText(tds[0].text);
        final heirName = HtmlUtils.cleanText(tds[1].text);
        final share = tds.length > 2 ? HtmlUtils.cleanText(tds[2].text) : null;
        final condition = tds.length > 3
            ? HtmlUtils.cleanText(tds[3].text)
            : '';

        final rules = <ShareRule>[];
        if (share != null || condition.isNotEmpty) {
          rules.add(
            ShareRule(
              share: share?.isNotEmpty == true ? share : null,
              condition: condition,
            ),
          );
        }

        for (int r = 1; r < rowspan; r++) {
          if (rowIdx + r >= rows.length) break;
          final subTds = rows[rowIdx + r].children
              .where((e) => e.localName == 'td' || e.localName == 'th')
              .toList();

          if (subTds.length == 1 &&
              (int.tryParse(subTds[0].attributes['colspan'] ?? '1') ?? 1) > 1) {
            final note = HtmlUtils.cleanText(subTds[0].text);
            if (note.isNotEmpty) {
              rules.add(ShareRule(condition: note, isNote: true));
            }
            continue;
          }

          final subShare = subTds.isNotEmpty
              ? HtmlUtils.cleanText(subTds[0].text)
              : null;
          final subCondition = subTds.length > 1
              ? HtmlUtils.cleanText(subTds[1].text)
              : '';

          if (subShare != null || subCondition.isNotEmpty) {
            rules.add(
              ShareRule(
                share: subShare?.isNotEmpty == true ? subShare : null,
                condition: subCondition,
              ),
            );
          }
        }

        heirs.add(ShareHeir(number: number, heirName: heirName, rules: rules));

        rowIdx += rowspan;
      } else {
        final number = HtmlUtils.cleanText(tds[0].text);
        final heirName = tds.length > 1 ? HtmlUtils.cleanText(tds[1].text) : '';
        final share = tds.length > 2 ? HtmlUtils.cleanText(tds[2].text) : null;
        final condition = tds.length > 3
            ? HtmlUtils.cleanText(tds[3].text)
            : '';

        heirs.add(
          ShareHeir(
            number: number,
            heirName: heirName,
            rules: [
              ShareRule(
                share: share?.isNotEmpty == true ? share : null,
                condition: condition,
              ),
            ],
          ),
        );

        rowIdx++;
      }
    }

    return ShareTableModel(heirs: heirs);
  }
}
