import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:movieapp/presentation/journeys/home/movie_detail/movie_detail_argument.dart';
import 'package:movieapp/presentation/journeys/home/movie_detail/movie_detail_screen.dart';

import '../../../data/core/api_constants.dart';

class FavouriteMovieCardWidget extends StatelessWidget {
  final MovieEntity movie;
  const FavouriteMovieCardWidget({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: Sizes.dimen_8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.dimen_8.w),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(RouteList.movieDetail,
              arguments: MovieDetailArguments(movieID: movieId));
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => MovieDetailScreen(
          //           movieDetailArguments:
          //               MovieDetailArguments(movieID: movie.id)),
          //     ));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_8.w),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: '${ApiConstants.baseImageUrl}${movie.posterPath}',
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () => BlocProvider.of<FavouriteBloc>(context).add(
                    DeleteFavouriteMovieEvent(movie.id),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(Sizes.dimen_12.w),
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.delete)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
