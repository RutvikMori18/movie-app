import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/no_params.dart';
import 'package:movieapp/domain/usecases/che_if_fav.dart';
import 'package:movieapp/domain/usecases/delete_fav_movie.dart';
import 'package:movieapp/domain/usecases/get_fav_movies.dart';

import '../../../domain/usecases/save_movie.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final SaveMovie saveMovie;
  final GetFavMovies getFavMovies;
  final CheckIfFavMovie checkIfFavMovie;
  final DeleteFavMovie deleteFavMovie;
  FavouriteBloc(
      {required this.saveMovie,
      required this.getFavMovies,
      required this.checkIfFavMovie,
      required this.deleteFavMovie})
      : super(FavouriteInitial()) {
    on<FavouriteEvent>((event, emit) async {
      if (event is ToggleFavouriteMovieEvent) {
        if (event.isFavourite) {
          await deleteFavMovie(event.movieEntity.id);
        } else {
          await saveMovie(event.movieEntity);
        }
        final response = await checkIfFavMovie(event.movieEntity.id);

        return response.fold(
            (l) => FavouriteMovieErrorState(), (r) => IsFavouriteMovieState(r));
      } else if (event is LoadFavMovieEvent) {
        final response = await getFavMovies(NoParams());

        return response.fold((l) => FavouriteMovieErrorState(),
            (r) => FavouriteMovieLoadedState(r));
      } else if (event is DeleteFavouriteMovieEvent) {
        await deleteFavMovie(event.movieId);
        final response = await getFavMovies(NoParams());

        return response.fold((l) => FavouriteMovieErrorState(),
            (r) => FavouriteMovieLoadedState(r));
      } else if (event is CheckIfFavouriteMovieEvent) {
        final response = await checkIfFavMovie(event.movieId);

        return response.fold((l) => FavouriteMovieErrorState(),
            (r) => CheckIfFavouriteMovieEvent(event.movieId));
      }
    });
  }
}
