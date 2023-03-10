import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrending();
  Future<Either<AppError, List<MovieEntity>>> getPopular();
  Future<Either<AppError, List<MovieEntity>>> getPlayNow();
  Future<Either<AppError, List<MovieEntity>>> getComingSoon();
}
