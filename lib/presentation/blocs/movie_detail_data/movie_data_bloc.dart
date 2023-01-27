import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_detail_entity.dart';
import 'package:movieapp/domain/entities/movie_params.dart';
import 'package:movieapp/domain/usecases/get_movie_detail.dart';
import 'package:movieapp/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:movieapp/presentation/blocs/get_videos/get_video_bloc.dart';

import '../cast/cast_bloc.dart';

part 'movie_data_event.dart';
part 'movie_data_state.dart';

class MovieDataBloc extends Bloc<MovieDataEvent, MovieDataState> {
  // final MovieDataModel movie;
  //instance of use-case and used it..
  final GetMovieDetail getMovieDetail;
  final CastBloc castBloc;
  final GetVideoBloc videoBloc;
  final FavouriteBloc favouriteBloc;

  MovieDataBloc(
      {required this.videoBloc,
      required this.castBloc,
      required this.favouriteBloc,
      required this.getMovieDetail})
      : super(MovieDataInitial()) {
    on<MovieDataEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is MovieDetailLoadEvent) {
        final Either<AppError, MovieDetailEntity> eitherResponse =
            await getMovieDetail(
          MovieParams(event.movieId),
        );

        favouriteBloc.add(CheckIfFavouriteMovieEvent(event.movieId));
        castBloc.add(
          LoadCastEvent(movieId: event.movieId),
        );
        videoBloc.add(LoadVideoEvent(movieId: event.movieId));
        //bloc will call the state
        return eitherResponse.fold(
          (l) => MovieDataError(),
          (r) => MovieDataLoaded(r),
        );
      }
    });
  }
}
