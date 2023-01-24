import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/presentation/blocs/get_videos/get_video_bloc.dart';

import '../../../../common/constants/translation_constants.dart';
import '../../../widgets/button.dart';
import '../../watch_video/watch_video_argument.dart';
import '../../watch_video/watch_video_screen.dart';

class VideoWidget extends StatelessWidget {
  final GetVideoBloc videoBloc;
  const VideoWidget({Key? key, required this.videoBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: videoBloc,
      builder: (context, state) {
        if (state is VideoLoadedState && state.videos.iterator.moveNext()) {
          final video = state.videos;
          return Button(
            text: TranslationConstants.watchTrailers,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WatchVideoScreen(
                    arguments: WatchVideoArguments(videos: video),
                  ),
                ),
              );
            },
          );
        } else if (state is NoVideosState) {
          return Container();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
