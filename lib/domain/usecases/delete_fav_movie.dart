import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

// UseCase<output,input>
class DeleteFavMovie extends UseCase<void, int> {
  final MovieRepository movieRepository;

  DeleteFavMovie(this.movieRepository);
  @override
  Future<Either<AppError, void>> call(int params) async {
    return await movieRepository.deleteFavMovie(params);
  }
}
