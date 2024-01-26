import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/domain/entities/app_error.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/movie_search_params.dart';
import '../../../domain/usecases/search_movies.dart';
import '../loading/loading_cubit.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMovies searchMovies;
  final LoadingCubit loadingCubit;
  SearchMoviesBloc({
    required this.searchMovies,
    required this.loadingCubit,
  }) : super(SearchMoviesInitial()) {
    on<SearchMoviesEvent>((event, emit) async {
      if (event is SearchMovieDataChangeEvent) {
        loadingCubit.show();
        if (event.searchData.length > 2) {
          SearchMoviesLoading();
          final Either<AppError, List<MovieEntity>> eitherResponse =
              await searchMovies(
                  MovieSearchParams(searchText: event.searchData));
          loadingCubit.hide();
          return eitherResponse.fold(
              (l) => emit(SearchMoviesError(errorType: l.appErrorType)), (r) {
            print('data---->${r.toString()}');
            emit(SearchMoviesDataState(r));
          });
        }
      }
    });
  }
}
