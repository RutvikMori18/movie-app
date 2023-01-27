import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movieapp/data/data_resources/movie_remote_data_source.dart';
import 'package:movieapp/data/models/CastCrewResultDataModel.dart';
import 'package:movieapp/data/models/movie_detail_model.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';

import '../../domain/repositories/movie_repository.dart';
import '../data_resources/movie_local_data_source.dart';
import '../models/Results.dart';
import '../models/movie_models.dart';
import '../tables/movie_table.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;

  MovieRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrendingMovies();
      return Right(movies);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getComingSoon() async {
    try {
      final movies = await remoteDataSource.getCommingSoon();
      final movie;
      return Right(movies);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPlayNow() async {
    try {
      final movies = await remoteDataSource.getPlayingNow();
      return Right(movies);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPopular() async {
    try {
      final movies = await remoteDataSource.getPopular();
      return Right(movies);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, MovieDataModel>> getMovieDetail(int id) async {
    try {
      final movies = await remoteDataSource.getMovieDetail(id);
      return Right(movies);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<CastModel>>> getCastCrew(int id) async {
    try {
      final castCrew = await remoteDataSource.getCastCrew(id);
      return Right(castCrew);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<Results>>> getVideos(int id) async {
    try {
      final castCrew = await remoteDataSource.getVideos(id);
      return Right(castCrew);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getSearchMovies(
      String searchText) async {
    try {
      final movies = await remoteDataSource.getSearchMovies(searchText);
      return Right(movies);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> checkIfMovieFav(int movieId) async {
    try {
      final response = await localDataSource.checkIfMovieFav(movieId);
      return Right(response);
    } on Exception catch (e) {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> deleteFavMovie(int movieId) async {
    try {
      final response = await localDataSource.deleteMovie(movieId);
      return Right(response);
    } on Exception catch (e) {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getFavMovies() async {
    try {
      final response = await localDataSource.getMovie();
      return Right(response);
    } on Exception catch (e) {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> saveMovie(MovieEntity movieEntity) async {
    try {
      final response = await localDataSource
          .saveMovie(MovieTable.fromMovieEntity(movieEntity));
      return Right(response);
    } on Exception catch (e) {
      return const Left(AppError(AppErrorType.database));
    }
  }
}
