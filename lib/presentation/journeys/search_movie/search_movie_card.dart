import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/data/core/api_constants.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/presentation/themes/theme_text.dart';

import '../home/movie_detail/movie_detail_argument.dart';
import '../home/movie_detail/movie_detail_screen.dart';

class SearchMovieCard extends StatelessWidget {
  final MovieEntity movie;
  const SearchMovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(
                movieDetailArguments: MovieDetailArguments(movieID: movie.id),
              ),
            ),
          );
          // Navigator.pushNamed(context, RouteList.movieDetail,
          //     arguments: MovieDetailArguments(movieID: movie.id));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Sizes.dimen_16.w, vertical: Sizes.dimen_2.h),
          child: Row(
            children: [
              InkWell(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    Sizes.dimen_4.w,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: '${ApiConstants.baseImageUrl}${movie.posterPath}',
                    width: Sizes.dimen_80.w,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      movie.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      movie.overview ?? '',
                      maxLines: 3,
                      style: Theme.of(context).textTheme.greySubtitle1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
