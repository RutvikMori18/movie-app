import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/domain/entities/movie_detail_entity.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';

import '../../../../common/constants/size_constants.dart';
import '../../../blocs/favourite/favourite_bloc.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;
  const MovieDetailAppBar({Key? key, required this.movieDetailEntity})
      : super(key: key);

  get movieDataEntity => movieDetailEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Sizes.dimen_12.h,
          ),
        ),
        BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state) {
            if (state is IsFavouriteMovieState) {
              return IconButton(
                onPressed: () {
                  BlocProvider.of<FavouriteBloc>(context).add(
                      ToggleFavouriteMovieEvent(
                          movieEntity: MovieEntity.fromMovieDetailEntity(
                              movieDetailEntity: movieDataEntity),
                          isFavourite: state.isfavourite));
                },
                icon: Icon(
                    state.isfavourite
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    color: Colors.white,
                    size: Sizes.dimen_12.h),
              );
            } else {
              return IconButton(
                onPressed: () {
                  BlocProvider.of<FavouriteBloc>(context).add(
                      ToggleFavouriteMovieEvent(
                          movieEntity: MovieEntity.fromMovieDetailEntity(
                              movieDetailEntity: movieDataEntity),
                          isFavourite: true));
                },
                icon: Icon(Icons.favorite_border_rounded,
                    color: Colors.white, size: Sizes.dimen_12.h),
              );
            }
          },
        ),
      ],
    );
  }
}
