import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/no_params.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

import '../repositories/movie_repository.dart';

class GetTrending extends UseCase<List<MovieEntity>, NoParams> {
   final MovieRepository movieRepository;
  GetTrending(this.movieRepository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async {
    return await movieRepository.getTrending();
  }
}
