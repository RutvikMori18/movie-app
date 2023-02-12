part of 'search_movies_bloc.dart';

abstract class SearchMoviesState extends Equatable {
  const SearchMoviesState();
}

class SearchMoviesInitial extends SearchMoviesState {
  @override
  List<Object> get props => [];
}

class SearchMoviesDataState extends SearchMoviesState {
  final List<MovieEntity> result;
  const SearchMoviesDataState(this.result);

  @override
  List<Object> get props => [result];
}

class SearchMoviesError extends SearchMoviesState {
  final AppErrorType errorType;

  const SearchMoviesError({required this.errorType});
  @override
  List<Object> get props => [errorType];
}

class SearchMoviesLoading extends SearchMoviesState {
  @override
  List<Object> get props => [];
}
