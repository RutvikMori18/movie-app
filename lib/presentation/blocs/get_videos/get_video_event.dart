part of 'get_video_bloc.dart';

abstract class GetVideoEvent extends Equatable {
  const GetVideoEvent();
}

class LoadVideoEvent extends GetVideoEvent {
  final int movieId;

  const LoadVideoEvent({required this.movieId});
  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}
