import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/presentation/blocs/cast/cast_bloc.dart';
import 'package:movieapp/presentation/themes/theme_text.dart';

import '../../../../data/core/api_constants.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(builder: (context, state) {
      if (state is CastLoaded) {
        print("state----$state");
        return Container(
          color: Colors.greenAccent,
          height: Sizes.dimen_105.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: state.casts.length,
              itemBuilder: (context, index) {
                final castEntity = state.casts[index];
                return Container(
                  height: Sizes.dimen_100.h,
                  width: Sizes.dimen_160.w,
                  child: Card(
                    elevation: 1,
                    margin: EdgeInsets.symmetric(
                      horizontal: Sizes.dimen_8.w,
                      vertical: Sizes.dimen_4.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(Sizes.dimen_8.w),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(Sizes.dimen_8.w),
                            ),
                            child: CachedNetworkImage(
                              height: Sizes.dimen_100.h,
                              width: Sizes.dimen_160.w,
                              imageUrl:
                                  '${ApiConstants.baseImageUrl}${castEntity.posterPath}',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Sizes.dimen_8.w),
                          child: Text(
                            castEntity.name,
                            style: Theme.of(context).textTheme.vulcanBodyText2,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: Sizes.dimen_8.w,
                              right: Sizes.dimen_8.w,
                              top: Sizes.dimen_2.h),
                          child: Text(
                            castEntity.character,
                            style: Theme.of(context).textTheme.caption,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        );
      }
      return const SizedBox.shrink();
    });
  }
}
