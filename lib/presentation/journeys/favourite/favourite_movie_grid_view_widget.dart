import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/extensions/size_extension.dart';

import '../../../domain/entities/movie_entity.dart';
import 'favourite_movie_card_widget.dart';

class FavouriteMovieGridWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  const FavouriteMovieGridWidget({Key? key, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_8.w),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: Sizes.dimen_16.w),
        itemCount: movies.length,
        itemBuilder: (context, index) => FavouriteMovieCardWidget(
          movie: movies[index],
        ),
      ),
    );
  }
}
