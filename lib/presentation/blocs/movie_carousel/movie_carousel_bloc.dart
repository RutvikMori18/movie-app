import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/no_params.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

import '../../../domain/entities/movie_detail_entity.dart';
import '../../../domain/usecases/get_trending.dart';
import '../loading/loading_bloc.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;
  final LoadingBloc loadingBloc;

  MovieCarouselBloc(
      {required this.getTrending,
      required this.loadingBloc,
      required this.movieBackdropBloc})
      : super(MovieCarouselInitial()) {
    on<MovieCarouselEvent>((event, emit) async {
      /*todo check whether async used or async*/
      if (event is CarouselLoadEvent) {
        loadingBloc.add(StartLoading());
        final movieEither = await getTrending(NoParams());
        return movieEither.fold((l) => emit(MovieCarouselError(l.appErrorType)),
            (movies) {
          movieBackdropBloc
              .add(MovieBackdropChangedEvent(movies[event.defaultIndex]));
          // MovieCarouselELoaded(defaultIndex: 0, movies: movies);

          /// Radhen - just emit to check the flow you need to emit this event in bloc
          emit(MovieCarouselELoaded(defaultIndex: 0, movies: movies));
        });
      }
    });
    loadingBloc.add(FinishLoading());
  }
}
