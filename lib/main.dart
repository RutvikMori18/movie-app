import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/domain/entities/app_error.dart';

import 'di/get_it.dart' as get_it;
import 'domain/entities/movie_entity.dart';
import 'domain/entities/no_params.dart';
import 'domain/usecases/get_trending.dart';

void main() async {
  unawaited(get_it.init());
  // MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl();
  // MovieRepository movieRepository = MovieRepositoryImpl(dataSource);
  // movieRepository.getTrending();
  // dataSource.getTrendingMovies();
  // dataSource.getPopular();
  // GetTrending getTrending = GetTrending(movieRepository);

  //We can also use it without call above function using dependency injection
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
  // if (result != null) {
  //   // show ui part
  // } else {
  //   //show null data
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
