import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/common/extensions/string_extension.dart';

import '../../../../common/constants/route_constants.dart';
import '../../../../common/constants/size_constants.dart';
import '../../../../data/core/api_constants.dart';
import '../movie_detail/movie_detail_argument.dart';
import '../movie_detail/movie_detail_screen.dart';

class MovieTabCardWidget extends StatelessWidget {
  final int movieId;
  final String title;
  final String posterPath;

  const MovieTabCardWidget({
    Key? key,
    required this.movieId,
    required this.title,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteList.movieDetail,
            arguments: [MovieDetailArguments(movieID: movieId)]);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => MovieDetailScreen(
        //       movieDetailArguments: MovieDetailArguments(movieID: movieId),
        //     ),
        //   ),
        // );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
              child: CachedNetworkImage(
                imageUrl: '${ApiConstants.baseImageUrl}$posterPath',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Sizes.dimen_4.h),
            child: Text(
              title.intelliTrim(),
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ],
      ),
    );
  }
}
