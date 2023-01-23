import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_detail_entity.dart';
import 'package:movieapp/domain/entities/movie_params.dart';
import 'package:movieapp/domain/usecases/get_movie_detail.dart';

part 'movie_data_event.dart';
part 'movie_data_state.dart';

class MovieDataBloc extends Bloc<MovieDataEvent, MovieDataState> {
  // final MovieDataModel movie;
  //instance of use-case and used it..
  final GetMovieDetail getMovieDetail;

  MovieDataBloc({required this.getMovieDetail}) : super(MovieDataInitial()) {
    on<MovieDataEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is MovieDetailLoadEvent) {
        final Either<AppError, MovieDetailEntity> eitherResponse =
            await getMovieDetail(
          MovieParams(event.movieId),
        );

        //bloc will call the state
        return eitherResponse.fold(
          (l) => MovieDataError(),
          (r) => MovieDataLoaded(r),
        );
      }
    });
  }
}