part of 'favourite_bloc.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();
}

class FavouriteInitial extends FavouriteState {
  @override
  List<Object> get props => [];
}

class FavouriteMovieLoadedState extends FavouriteState {
  final List<MovieEntity> movies;

  const FavouriteMovieLoadedState(this.movies);
  @override
  List<Object> get props => [];
}

class FavouriteMovieErrorState extends FavouriteState {
  @override
  List<Object> get props => [];
}

class IsFavouriteMovieState extends FavouriteState {
  final bool isfavourite;

  const IsFavouriteMovieState(this.isfavourite);
  @override
  List<Object> get props => [isfavourite];
}
