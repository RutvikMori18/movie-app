import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

// UseCase<output,input>
class CheckIfFavMovie extends UseCase<bool, int> {
  final MovieRepository movieRepository;

  CheckIfFavMovie(this.movieRepository);
  @override
  Future<Either<AppError, bool>> call(int params) async {
    return await movieRepository.checkIfMovieFav(params);
  }
}
