import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/no_params.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

import '../repositories/movie_repository.dart';

class GetPlayingNow extends UseCase<List<MovieEntity>, NoParams> {
  late final MovieRepository movieRepository;
  GetPlayingNow(this.movieRepository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async {
    return await movieRepository.getPlayNow();
  }
}
