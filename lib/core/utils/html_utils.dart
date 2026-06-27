class HtmlUtils {
  static String cleanText(String text) {
    return text
        .replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }
}
