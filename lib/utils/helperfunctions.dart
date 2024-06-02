String trimString(String input) {
  return input.trim();
}

String bulletSentences(String paragraph) {
  final sentences = paragraph.split('.');

  final filteredSentences = sentences
      .where((sentence) => sentence.trim().isNotEmpty)
      .map((sentence) => '• ${sentence.trim()}')
      .toList();

  return filteredSentences.join('\n');
}
