part of 'movie_data_bloc.dart';

abstract class MovieDataState extends Equatable {
  const MovieDataState();
}

class MovieDataInitial extends MovieDataState {
  @override
  List<Object> get props => [];
}

class MovieDataLoading extends MovieDataState {
  @override
  List<Object> get props => [];
}

class MovieDataError extends MovieDataState {
  @override
  List<Object> get props => [];
}

class MovieDataLoaded extends MovieDataState {
  final MovieDetailEntity movieDetailEntity;
  //state will call the events
  const MovieDataLoaded(this.movieDetailEntity);
  @override
  List<Object> get props => [movieDetailEntity];
}
