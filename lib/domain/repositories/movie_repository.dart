import 'package:dartz/dartz.dart';

import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/cast_entity.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';

import '../entities/movie_detail_entity.dart';
import '../entities/video_entity.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrending();
  Future<Either<AppError, List<MovieEntity>>> getPopular();
  Future<Either<AppError, List<MovieEntity>>> getPlayNow();
  Future<Either<AppError, List<MovieEntity>>> getComingSoon();
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id);
  Future<Either<AppError, List<CastEntity>>> getCastCrew(int id);
  Future<Either<AppError, List<VideoEntity>>> getVideos(int id);
  Future<Either<AppError, List<MovieEntity>>> getSearchMovies(
      String searchText);

  //for local
  Future<Either<AppError, void>> saveMovie(MovieEntity movieEntity);
  Future<Either<AppError, bool>> checkIfMovieFav(int movieId);
  Future<Either<AppError, List<MovieEntity>>> getFavMovies();
  Future<Either<AppError, void>> deleteFavMovie(int movieId);
}
