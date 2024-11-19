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
}
