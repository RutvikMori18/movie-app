import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/domain/entities/app_error.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/movie_search_params.dart';
import '../../../domain/usecases/search_movies.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMovies searchMovies;
  SearchMoviesBloc({required this.searchMovies})
      : super(SearchMoviesInitial()) {
    on<SearchMoviesEvent>((event, emit) async {
      if (event is SearchMovieDataChangeEvent) {
        if (event.searchData.length > 2) {
          SearchMoviesLoading();
          final Either<AppError, List<MovieEntity>> eitherResponse =
              await searchMovies(
                  MovieSearchParams(searchText: event.searchData));
          eitherResponse.fold(
              (l) => SearchMoviesError(errorType: l.appErrorType),
              (r) => SearchMoviesDataState(r));
        }
      }
    });
  }
}
