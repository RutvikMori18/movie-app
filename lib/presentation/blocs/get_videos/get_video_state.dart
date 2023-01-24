part of 'get_video_bloc.dart';

abstract class GetVideoState extends Equatable {
  const GetVideoState();
}

class GetVideoInitial extends GetVideoState {
  @override
  List<Object> get props => [];
}

class VideoLoadedState extends GetVideoState {
  final List<VideoEntity> videos;

  const VideoLoadedState({required this.videos});
  @override
  List<Object> get props => [videos];
}

class NoVideosState extends GetVideoState {
  @override
  List<Object> get props => [];
}
