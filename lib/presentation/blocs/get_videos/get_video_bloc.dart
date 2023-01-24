import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/domain/entities/app_error.dart';

import '../../../domain/entities/movie_params.dart';
import '../../../domain/entities/video_entity.dart';
import '../../../domain/usecases/get_videos.dart';

part 'get_video_event.dart';
part 'get_video_state.dart';

class GetVideoBloc extends Bloc<GetVideoEvent, GetVideoState> {
  final GetVideos getVideos;
  GetVideoBloc({required this.getVideos}) : super(GetVideoInitial()) {
    on<GetVideoEvent>((event, emit) async {
      if (event is LoadVideoEvent) {
        final Either<AppError, List<VideoEntity>> eitherResponse =
            await getVideos(MovieParams(event.movieId));

        return eitherResponse.fold(
            (l) => NoVideosState(), (r) => VideoLoadedState(videos: r));
      }
    });
  }
}
