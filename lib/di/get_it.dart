import 'package:get_it/get_it.dart';
import 'package:movieapp/data/data_resources/movie_remote_data_source.dart';
import 'package:movieapp/data/repositories/movie_repository_impl.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/get_coming_soon.dart';
import 'package:movieapp/domain/usecases/get_playing_now.dart';
import 'package:movieapp/domain/usecases/get_popular.dart';
import 'package:movieapp/domain/usecases/get_trending.dart';

final getInstance = GetIt.I;

Future init() async {
  //all dependence goes here

// getInstance.registerLazySingleton<Client>(() => Client());
// getInstance.registerLazySingleton<ApiClient>(() => ApiClient(getInstance()));

  getInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl());

  getInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getInstance()));
  getInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getInstance()));
  getInstance
      .registerLazySingleton<GetComingSoon>(() => GetComingSoon(getInstance()));
  getInstance
      .registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(getInstance()));

  getInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getInstance()));
}
