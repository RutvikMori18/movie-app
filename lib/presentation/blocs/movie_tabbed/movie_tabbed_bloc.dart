import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/no_params.dart';
import 'package:movieapp/domain/usecases/get_coming_soon.dart';
import 'package:movieapp/domain/usecases/get_playing_now.dart';
import 'package:movieapp/domain/usecases/get_trending.dart';

import '../../../domain/entities/app_error.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetTrending getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;
  MovieTabbedBloc(
      {required this.getPopular,
      required this.getPlayingNow,
      required this.getComingSoon})
      : super(const MovieTabbedInitial(currentTabIndex: 0)) {
    on<MovieTabChangedEvent>((event, emit) async {
      if (event is MovieTabChangedEvent) {
        MovieTabLoadingState(currentTabIndex: event.currentTabIndex);
        print('bloc will call in any function in.......');
        Either<AppError, List<MovieEntity>> moviesEither;
        switch (event.currentTabIndex) {
          case 0:
            moviesEither = await getPopular(NoParams());
            break;
          case 1:
            moviesEither = await getPlayingNow(NoParams());
            break;

          case 2:
            moviesEither = await getComingSoon(NoParams());
            break;
          default:
            moviesEither = await getPopular(NoParams());
            break;
        }

        return moviesEither.fold(
          (l) => MovieTabLoadError(
            currentTabIndex: event.currentTabIndex,
            errorType: l.appErrorType,
          ),
          (movies) => emit(
            MovieTabbedChanged(event.currentTabIndex, movies),
          ),
        );
      }
      print('bloc will call in any function');
    });
  }
}
