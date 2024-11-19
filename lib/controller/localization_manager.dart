class LocalizationManager {
  String languageCode;
  LocalizationManager(this.languageCode);

  static const String defaultLanguageCode = "en";

  final Map<String, Map<String, String>> _mapLanguages = {
    "pt": {
      "clearBooksText": "Limpar todos os livros",
    },
    "en": {
      "clearBooksText": "Clear all books",
    },
    "es": {
      "clearBooksText": "Eliminar todos los libros",
    }
  };

  String _getSentence(String keySentence) {
    String? sentence = _mapLanguages[languageCode]?[keySentence];
    sentence ??= _mapLanguages[defaultLanguageCode]![keySentence]!;
    return sentence;
  }

  String get clearBooksText => _getSentence("clearBooksText");
}
