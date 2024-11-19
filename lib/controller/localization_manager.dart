import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LocalizationManager with ChangeNotifier {
  String languageCode;
  LocalizationManager(this.languageCode);

  static const String defaultLanguageCode = "en";

  final Map<String, Map<String, String>> _mapLanguages = {};

  Future<void> setLanguage(String newCode) async {
    await getLanguageFromServer(newCode);
    languageCode = newCode;
    notifyListeners();
  }

  Future<void> getLanguageFromServer(String newCode) async {
    String url =
        "https://gist.githubusercontent.com/ricarthlima/52c31eacaf0f28ba7a49e45e0adca89d/raw/cb6a4773731423e6cff91b6a7cfc8198be2ca04d/app_$newCode.json";

    http.Response httpResponse = await http.get(Uri.parse(url));
    Map<String, dynamic> response = json.decode(httpResponse.body);

    _mapLanguages[newCode] = response.map(
      (key, value) => MapEntry(key, value.toString()),
    );
  }

  // Sentenças
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
