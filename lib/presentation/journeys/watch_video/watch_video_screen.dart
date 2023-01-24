import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/translation_constants.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/common/extensions/string_extension.dart';
import 'package:movieapp/domain/entities/video_entity.dart';
import 'package:movieapp/presentation/journeys/watch_video/watch_video_argument.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../common/constants/size_constants.dart';

class WatchVideoScreen extends StatefulWidget {
  final WatchVideoArguments arguments;
  const WatchVideoScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  State<WatchVideoScreen> createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  List<VideoEntity>? _videos;
  late YoutubePlayerController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videos = widget.arguments.videos;

    if (_videos!.isNotEmpty && _videos != null) {
      controller = YoutubePlayerController(
          initialVideoId: _videos![0].key,
          flags: const YoutubePlayerFlags(autoPlay: true, mute: true));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslationConstants.watchTrailers.t(context),
        ),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller,
          aspectRatio: 16 / 9,
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < ((_videos)?.length ?? 0); i++)
                      SizedBox(
                        height: Sizes.dimen_60.h,
                        child: Row(
                          children: [
                            InkWell(
                              child: CachedNetworkImage(
                                imageUrl: YoutubePlayer.getThumbnail(
                                    videoId: _videos![i].key,
                                    quality: ThumbnailQuality.high),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                _videos![0].title,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ))
            ],
          );
        },
      ),
    );
  }
}
