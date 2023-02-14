import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/domain/entities/app_error.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/movie_search_params.dart';
import '../../../domain/usecases/search_movies.dart';
import '../loading/loading_bloc.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMovies searchMovies;
  final LoadingBloc loadingBloc;
  SearchMoviesBloc({
    required this.searchMovies,
    required this.loadingBloc,
  }) : super(SearchMoviesInitial()) {
    on<SearchMoviesEvent>((event, emit) async {
      if (event is SearchMovieDataChangeEvent) {
        loadingBloc.add(StartLoading());
        if (event.searchData.length > 2) {
          SearchMoviesLoading();
          final Either<AppError, List<MovieEntity>> eitherResponse =
              await searchMovies(
                  MovieSearchParams(searchText: event.searchData));
          loadingBloc.add(FinishLoading());
          return eitherResponse
              .fold((l) => SearchMoviesError(errorType: l.appErrorType), (r) {
            print('data---->${r.toString()}');
            SearchMoviesDataState(r);
          });
        }
      }
    });
  }
}
