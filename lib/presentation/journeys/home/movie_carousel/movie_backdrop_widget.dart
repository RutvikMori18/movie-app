import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/common/screen_util/screenutil.dart';
import 'package:movieapp/data/core/api_constants.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

class MovieBackDropWidget extends StatelessWidget {
  const MovieBackDropWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          BorderRadius.vertical(bottom: Radius.circular(Sizes.dimen_40.w)),
      child: Stack(
        children: [
          FractionallySizedBox(
            heightFactor: 1.0,
            widthFactor: 1.0,
            child: BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
              builder: (context, state) {
                if (state is MovieBackdropChanged) {
                  return CachedNetworkImage(
                    imageUrl:
                        '${ApiConstants.baseImageUrl}${state.movie.posterPath}',
                    fit: BoxFit.fitHeight,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              height: 1,
              width: ScreenUtil.screenWidth,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
