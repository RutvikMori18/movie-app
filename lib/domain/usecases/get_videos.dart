import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/video_entity.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

import '../entities/movie_params.dart';
import '../repositories/movie_repository.dart';

class GetVideos extends UseCase<List<VideoEntity>, MovieParams> {
  final MovieRepository movieRepository;
  GetVideos(this.movieRepository);

  @override
  Future<Either<AppError, List<VideoEntity>>> call(MovieParams params) async {
    return await movieRepository.getVideos(params.id);
  }
}
