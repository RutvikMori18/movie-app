import 'dart:async';

import 'package:hive/hive.dart';

abstract class LanguageLocalDataSourse {
  Future<void> updateLangauge(String languageCode);
  Future<String> getPrefferedLangauge();
}

class LanguageLocalDataSourceImpl extends LanguageLocalDataSourse {
  @override
  Future<String> getPrefferedLangauge() async {
    final languageBox = await Hive.openBox('languageBox');
    return languageBox.get('preferred_language');
  }

  @override
  Future<void> updateLangauge(String languageCode) async {
    final languageBox = await Hive.openBox('languageBox');
    unawaited(languageBox.put('preferred_language', languageCode));
  }
}
