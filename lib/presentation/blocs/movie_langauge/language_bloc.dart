import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/language.dart';
import 'package:movieapp/domain/entities/language_entity.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageLoaded(Locale(Language.languages[0].code))) {
    on<LanguageEvent>((event, emit) {
      if (event is ToggleLanguageEvent) {
        emit(LanguageLoaded(Locale(event.languageEntity.code)));
      }
    });
  }
}
