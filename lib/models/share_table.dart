class TableModel {
  final List<TableRowModel> rows;

  const TableModel({required this.rows});
}

class TableRowModel {
  final List<TableCellModel> cells;

  const TableRowModel({required this.cells});
}

class TableCellModel {
  final String text;

  final int rowspan;

  final int colspan;

  final List<String> classes;

  final Map<String, String> styles;

  const TableCellModel({
    required this.text,
    this.rowspan = 1,
    this.colspan = 1,
    this.classes = const [],
    this.styles = const {},
  });
}

class ShareTableModel {
  final List<ShareHeir> heirs;

  const ShareTableModel({required this.heirs});
}

class ShareHeir {
  final String number;
  final String heirName;
  final List<ShareRule> rules;

  ShareHeir({
    required this.number,
    required this.heirName,
    List<ShareRule>? rules,
  }) : rules = rules ?? [];
}

class ShareRule {
  final String? share;

  final String condition;

  final bool isNote;

  const ShareRule({this.share, required this.condition, this.isNote = false});
}
