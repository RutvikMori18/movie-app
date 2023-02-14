import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/cast_entity.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

import '../entities/movie_params.dart';
import '../repositories/movie_repository.dart';

class GetCastCrew extends UseCase<List<CastEntity>, MovieParams> {
  final MovieRepository movieRepository;
  GetCastCrew(this.movieRepository);
  @override
  Future<Either<AppError, List<CastEntity>>> call(MovieParams params) async {
    return await movieRepository.getCastCrew(params.id);
  }
}
