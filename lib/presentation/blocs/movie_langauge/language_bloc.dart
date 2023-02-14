import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/language.dart';
import 'package:movieapp/domain/entities/language_entity.dart';

import '../../../domain/entities/no_params.dart';
import '../../../domain/usecases/get_preferred_language.dart';
import '../../../domain/usecases/update_langugae.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetPreferredLanguage getPreferredLanguage;
  final UpdateLanguage updateLanguage;
  LanguageBloc(
      {required this.getPreferredLanguage, required this.updateLanguage})
      : super(LanguageLoaded(Locale(Language.languages[0].code))) {
    on<LanguageEvent>((event, emit) async {
      if (event is ToggleLanguageEvent) {
        await updateLanguage(event.languageEntity.code);
        emit(LanguageLoaded(Locale(event.languageEntity.code)));
      } else if (event is LoadPreferredEvent) {
        final response = await getPreferredLanguage(NoParams());
        response.fold((l) => LanguageError(), (r) => LanguageLoaded(Locale(r)));
      }
    });
  }
}
