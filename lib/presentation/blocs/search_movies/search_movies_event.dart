part of 'search_movies_bloc.dart';

abstract class SearchMoviesEvent extends Equatable {
  const SearchMoviesEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchMovieDataChangeEvent extends SearchMoviesEvent {
  final String searchData;

  const SearchMovieDataChangeEvent({required this.searchData});

  @override
  // TODO: implement props
  List<Object?> get props => [searchData];
}
