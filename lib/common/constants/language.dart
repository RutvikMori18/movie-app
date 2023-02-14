import 'package:movieapp/domain/entities/language_entity.dart';

class Language {
  const Language._();

  static List<LanguageEntity> languages = [
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'es', value: 'Spanish'),
  ];
}
