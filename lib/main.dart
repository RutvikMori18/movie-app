import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp/di/get_it.dart' as get_it;
import 'package:movieapp/presentation/app_localizations.dart';
import 'package:movieapp/presentation/movie_app.dart';

import 'domain/entities/app_error.dart';
import 'domain/entities/movie_entity.dart';
import 'domain/entities/no_params.dart';
import 'domain/usecases/get_trending.dart';

Future<void> main() async {
  unawaited(get_it.init());
  AppLocalization(const Locale('en'));
  /*  unawaited(get_it.init());

  // MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl();
  // MovieRepository movieRepository = MovieRepositoryImpl(dataSource);
  // movieRepository.getTrending();
  // dataSource.getTrendingMovies();
  // dataSource.getPopular();
  // GetTrending getTrending = GetTrending(movieRepository);

  ///We can also use it without call above function using dependency injection

  GetTrending getTrending = get_it.getInstance<GetTrending>();

  final Either<AppError, List<MovieEntity>> result =
      await getTrending(NoParams());
  result.fold(
    (l) {
      print('error ->$l');
    },
    (r) {
      print('List of Movies ->$r');
    },
  );

  ///instead of below code we can right above things

  // if (result != null) {
  //   // show ui part
  // } else {
  //   //show null data
  // }*/

  GetTrending getTrending = get_it.getInstance<GetTrending>();

  final Either<AppError, List<MovieEntity>> result =
      await getTrending(NoParams());
  result.fold(
    (l) {
      print('error ->$l');
    },
    (r) {
      print('List of Movies ->$r');
    },
  );
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(get_it.init());
  runApp(const MovieApp());
}
