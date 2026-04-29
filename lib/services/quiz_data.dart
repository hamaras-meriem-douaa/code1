class QuizData {
  static final List<String> _keywords = [];

  static void add(String value) {
    if (!_keywords.contains(value)) {
      _keywords.add(value);
    }
  }

  static String buildMessage() {
    return _keywords.join(";");
  }

  static void reset() {
    _keywords.clear();
  }
}