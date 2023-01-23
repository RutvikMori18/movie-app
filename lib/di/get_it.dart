import 'package:get_it/get_it.dart';
import 'package:movieapp/data/data_resources/movie_remote_data_source.dart';
import 'package:movieapp/data/repositories/movie_repository_impl.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/get_coming_soon.dart';
import 'package:movieapp/domain/usecases/get_movie_detail.dart';
import 'package:movieapp/domain/usecases/get_playing_now.dart';
import 'package:movieapp/domain/usecases/get_popular.dart';
import 'package:movieapp/domain/usecases/get_trending.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_detail_data/movie_data_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_langauge/language_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';

final getInstance = GetIt.I;

Future init() async {
  //all dependence(bloc initialize) goes here

// getInstance.registerLazySingleton<Client>(() => Client());
// getInstance.registerLazySingleton<ApiClient>(() => ApiClient(getInstance()));

//registerLazySingleton used for the lazy initialize of the blocs

//initialize for api call
  getInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl());

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

  getInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getInstance()));

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
    ),
  );

  //for single used singleton
  getInstance.registerSingleton<LanguageBloc>(LanguageBloc());
}
