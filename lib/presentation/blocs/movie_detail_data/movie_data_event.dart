part of 'movie_data_bloc.dart';

abstract class MovieDataEvent extends Equatable {
  const MovieDataEvent();
}

class MovieDetailLoadEvent extends MovieDataEvent {
  final int movieId;
  const MovieDetailLoadEvent(this.movieId);
  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}
