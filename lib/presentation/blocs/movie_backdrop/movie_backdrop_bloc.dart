import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';

part 'movie_backdrop_event.dart';
part 'movie_backdrop_state.dart';

class MovieBackdropBloc extends Bloc<MovieBackdropEvent, MovieBackdropState> {
  //TODO: Radhen
  // MovieBackdropBloc() : super(MovieBackdropInitial());

  MovieBackdropBloc() : super(MovieBackdropInitial()) {
    //TODO: Radhen - register every event like this or check online tutorial to register block events
    on<MovieBackdropEvent>((event, emit) {
      emit(MovieBackdropChanged((event as MovieBackdropChangedEvent).movie));
    });
  }
}
