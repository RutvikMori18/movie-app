part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();
}

class MovieCarouselInitial extends MovieCarouselState {
  @override
  List<Object> get props => [];
}

class MovieCarouselError extends MovieCarouselState {
  final AppErrorType errorType;
  const MovieCarouselError(this.errorType);
  @override
  List<Object> get props => [];
}

class MovieCarouselELoaded extends MovieCarouselState {
  final List<MovieEntity> movies;
  final int defaultIndex;
  const MovieCarouselELoaded({required this.defaultIndex, required this.movies})
      : assert(defaultIndex >= 0, 'defaultIndex can not be less than 0');
  @override
  List<Object> get props => [movies, defaultIndex];
}
