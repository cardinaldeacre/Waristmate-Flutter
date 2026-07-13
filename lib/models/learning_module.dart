class LearningModule {
  final int bab;
  final String title;
  final String contentHtml;
  final String searchText;

  LearningModule({
    required this.bab,
    required this.title,
    required this.contentHtml,
    required this.searchText,
  });

  factory LearningModule.fromMap(Map<String, dynamic> map) {
    return LearningModule(
      bab: map['bab'] as int,
      title: map['title'] as String,
      contentHtml: map['content_html'] as String,
      searchText: map['search_text'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bab': bab,
      'title': title,
      'content_html': contentHtml,
      'search_text': searchText,
    };
  }

  LearningModule copyWith({
    int? bab,
    String? title,
    String? contentHtml,
    String? searchText,
  }) {
    return LearningModule(
      bab: bab ?? this.bab,
      title: title ?? this.title,
      contentHtml: contentHtml ?? this.contentHtml,
      searchText: searchText ?? this.searchText,
    );
  }
}
