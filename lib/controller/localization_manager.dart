import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/utils/prefs_keys.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationManager with ChangeNotifier {
  String languageCode = "en";
  static const String defaultLanguageCode = "en";

  final Map<String, Map<String, String>> _mapLanguages = {};

  Future<void> setLanguage(String newCode) async {
    await getLanguageFromServer(newCode);
    _saveLanguageCode(newCode);
    languageCode = newCode;
    notifyListeners();
  }

  Future<void> _saveLanguageCode(String newCode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(PrefsKeys.language, newCode);
  }

  Future<void> loadLanguageCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? possibleLanguage = prefs.getString(PrefsKeys.language);

    if (possibleLanguage != null) {
      languageCode = possibleLanguage;
    } else {
      languageCode = defaultLanguageCode;
    }

    await getLanguageFromServer(languageCode);

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

    _saveLanguageFile(newCode);
  }

  Future<void> _saveLanguageFile(String newCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      PrefsKeys().languageFile(newCode),
      json.encode(_mapLanguages[newCode]),
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
  String get homeTitle => _getSentence("homeTitle");
  String get homeEmpty => _getSentence("homeEmpty");
  String get homeEmptyCall => _getSentence("homeEmptyCall");
}
