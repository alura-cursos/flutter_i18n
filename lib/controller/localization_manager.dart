import 'package:flutter/material.dart';

class LocalizationManager with ChangeNotifier {
  String languageCode;
  LocalizationManager(this.languageCode);

  static const String defaultLanguageCode = "en";

  final Map<String, Map<String, String>> _mapLanguages = {
    "pt": {
      "clearBooksText": "Limpar todos os livros",
      "languageText": "Idioma",
      "clearButton": "Limpar",
      "defaultDeviceLanguageItem": "Padrão do dispositivo"
    },
    "es": {
      "clearBooksText": "Eliminar todos los libros",
      "languageText": "Idioma",
      "clearButton": "Limpiar",
      "defaultDeviceLanguageItem": "Estándar del dispositivo"
    },
    "en": {
      "clearBooksText": "Clear all books",
      "languageText": "Language",
      "clearButton": "Clear",
      "defaultDeviceLanguageItem": "Device default"
    },
  };

  setLanguage(String newCode) {
    languageCode = newCode;
    notifyListeners();
  }

  String _getSentence(String keySentence) {
    String? sentence = _mapLanguages[languageCode]?[keySentence];
    sentence ??= _mapLanguages[defaultLanguageCode]![keySentence]!;
    return sentence;
  }

  String get clearBooksText => _getSentence("clearBooksText");
  String get languageText => _getSentence("languageText");
  String get clearButton => _getSentence("clearButton");
  String get defaultDeviceLanguageItem =>
      _getSentence("defaultDeviceLanguageItem");
}
