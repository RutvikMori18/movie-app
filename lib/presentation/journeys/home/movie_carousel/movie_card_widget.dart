import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/common/extensions/size_extension.dart';

import '../../../../common/constants/route_constants.dart';
import '../../../../common/constants/size_constants.dart';
import '../../../../data/core/api_constants.dart';
import '../movie_detail/movie_detail_argument.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String moviePath;
  const MovieCardWidget(
      {Key? key, required this.movieId, required this.moviePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteList.movieDetail,
            arguments: MovieDetailArguments(movieID: movieId));
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => MovieDetailScreen(
        //       movieDetailArguments: MovieDetailArguments(movieID: movieId),
        //     ),
        //   ),
        // );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
        child: CachedNetworkImage(
          imageUrl: '${ApiConstants.baseImageUrl}$moviePath',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
