import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp/common/constants/language.dart';

class AppLocalization {
  Locale locale;

  AppLocalization(this.locale);

  //used for all the string
  static AppLocalization of(context) =>
      Localizations.of<AppLocalization>(context, AppLocalization)!;

  Map<String, String> _localizationStrings;

  Future<bool> load() async {
    final jsonString = await rootBundle
        .loadString('assets/languages/${locale.languageCode}.json');

    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizationStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));

    return true;
  }

  String translate(String key) {
    return _localizationStrings[key] ?? 'no data';
  }

  static LocalizationsDelegate<AppLocalization> delegate =
      const _AppLocalizationDelegate();
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
    return Language.languages
        .map((e) => e.code)
        .toList()
        .contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = AppLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}
