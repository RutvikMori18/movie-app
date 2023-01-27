part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadFavMovieEvent extends FavouriteEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DeleteFavouriteMovieEvent extends FavouriteEvent {
  final int movieId;

  const DeleteFavouriteMovieEvent(this.movieId);
  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}

class ToggleFavouriteMovieEvent extends FavouriteEvent {
  final MovieEntity movieEntity;
  final bool isFavourite;

  const ToggleFavouriteMovieEvent(
      {required this.movieEntity, required this.isFavourite});
  @override
  // TODO: implement props
  List<Object?> get props => [movieEntity, isFavourite];
}

class CheckIfFavouriteMovieEvent extends FavouriteEvent {
  final int movieId;

  const CheckIfFavouriteMovieEvent(this.movieId);
  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}
