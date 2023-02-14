import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_detail_entity.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

import '../entities/movie_params.dart';
import '../repositories/movie_repository.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity, MovieParams> {
  late final MovieRepository movieRepository;
  GetMovieDetail(this.movieRepository);
  @override
  Future<Either<AppError, MovieDetailEntity>> call(MovieParams params) async {
    return await movieRepository.getMovieDetail(params.id);
  }
}
