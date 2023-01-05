import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/data/core/api_constants.dart';

import '../../../../common/constants/size_constants.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String moviePath;
  const MovieCardWidget(
      {Key? key, required this.movieId, required this.moviePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
