import 'package:get_it/get_it.dart';
import 'package:movieapp/data/data_resources/movie_remote_data_source.dart';
import 'package:movieapp/data/repositories/movie_repository_impl.dart';
import 'package:movieapp/domain/repositories/app_repository.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/delete_fav_movie.dart';
import 'package:movieapp/domain/usecases/get_cast_crew.dart';
import 'package:movieapp/domain/usecases/get_coming_soon.dart';
import 'package:movieapp/domain/usecases/get_fav_movies.dart';
import 'package:movieapp/domain/usecases/get_movie_detail.dart';
import 'package:movieapp/domain/usecases/get_playing_now.dart';
import 'package:movieapp/domain/usecases/get_popular.dart';
import 'package:movieapp/domain/usecases/get_trending.dart';
import 'package:movieapp/domain/usecases/get_videos.dart';
import 'package:movieapp/domain/usecases/search_movies.dart';
import 'package:movieapp/domain/usecases/update_langugae.dart';
import 'package:movieapp/presentation/blocs/cast/cast_bloc.dart';
import 'package:movieapp/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:movieapp/presentation/blocs/get_videos/get_video_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_detail_data/movie_data_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_langauge/language_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movieapp/presentation/blocs/search_movies/search_movies_bloc.dart';

import '../data/data_resources/language_local_data_source.dart';
import '../data/data_resources/movie_local_data_source.dart';
import '../data/repositories/app_repository_impl.dart';
import '../domain/usecases/che_if_fav.dart';
import '../domain/usecases/get_preferred_language.dart';

final getInstance = GetIt.I;

Future init() async {
  //all dependence(bloc initialize) goes here

// getInstance.registerLazySingleton<Client>(() => Client());
// getInstance.registerLazySingleton<ApiClient>(() => ApiClient(getInstance()));

//registerLazySingleton used for the lazy initialize of the blocs

//initialize for api call (DATA SOURCE)
  getInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl());
  getInstance.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocaleDataSourceImpl());
  getInstance.registerLazySingleton<LanguageLocalDataSourse>(
      () => LanguageLocalDataSourceImpl());

  //initialize it's methods
  getInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getInstance()));
  getInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getInstance()));
  getInstance
      .registerLazySingleton<GetComingSoon>(() => GetComingSoon(getInstance()));
  getInstance
      .registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(getInstance()));
  getInstance.registerLazySingleton<GetMovieDetail>(
      () => GetMovieDetail(getInstance()));
  getInstance
      .registerLazySingleton<GetCastCrew>(() => GetCastCrew(getInstance()));
  getInstance
      .registerLazySingleton<SearchMovies>(() => SearchMovies(getInstance()));
  getInstance.registerLazySingleton<GetVideos>(() => GetVideos(getInstance()));
  // getInstance
  //     .registerLazySingleton<SearchMovies>(() => SearchMovies(getInstance()));
  getInstance.registerLazySingleton<CheckIfFavMovie>(
      () => CheckIfFavMovie(getInstance()));
  getInstance.registerLazySingleton<DeleteFavMovie>(
      () => DeleteFavMovie(getInstance()));
  getInstance
      .registerLazySingleton<GetFavMovies>(() => GetFavMovies(getInstance()));
  getInstance.registerLazySingleton<UpdateLanguage>(
      () => UpdateLanguage(getInstance()));
  getInstance.registerLazySingleton<GetPreferredLanguage>(
      () => GetPreferredLanguage(getInstance()));

  //initialize it's Repository
  getInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getInstance(), getInstance()));
  getInstance.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(
        getInstance(),
      ));

  //if we want the new instance of the bloc then used registerFactory
  getInstance.registerFactory(() => MovieBackdropBloc());
  getInstance.registerFactory(() => MovieCarouselBloc(
      getTrending: getInstance(), movieBackdropBloc: getInstance()));

  //registerFactory used to instant register the blocs
  getInstance.registerFactory(
    () => MovieTabbedBloc(
        //todo check
        getPopular: getInstance(),
        getPlayingNow: getInstance(),
        getComingSoon: getInstance()),
  );

  getInstance.registerFactory(
    () => MovieDataBloc(
      getMovieDetail: getInstance(),
      castBloc: getInstance(),
      videoBloc: getInstance(),
      favouriteBloc: getInstance(),
    ),
  );

  getInstance.registerFactory<CastBloc>(
    () => CastBloc(
      getCast: getInstance(),
    ),
  );
  getInstance.registerFactory<SearchMoviesBloc>(
    () => SearchMoviesBloc(
      searchMovies: getInstance(),
    ),
  );

  getInstance.registerFactory<GetVideoBloc>(
    () => GetVideoBloc(getVideos: getInstance()),
  );
  getInstance.registerFactory(() => FavouriteBloc(
      saveMovie: getInstance(),
      getFavMovies: getInstance(),
      checkIfFavMovie: getInstance(),
      deleteFavMovie: getInstance()));
  //for single used singleton
  getInstance.registerSingleton<LanguageBloc>(LanguageBloc(
      getPreferredLanguage: getInstance(), updateLanguage: getInstance()));
}
