import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:waristmate_app/logic/table_parser.dart';
import 'package:waristmate_app/widgets/modul/heir_card.dart';

class NativeShareTable extends StatelessWidget {
  final dom.Element tableElement;
  final double fontSize;

  const NativeShareTable({
    super.key,
    required this.tableElement,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final parser = const GenericTableParser();
    final table = parser.parse(tableElement);

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: table.heirs.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (_, index) {
        return HeirCard(heir: table.heirs[index], fontSize: fontSize);
      },
    );
  }
}
