import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/common/screen_util/screenutil.dart';
import 'package:movieapp/presentation/blocs/search_movies/search_movies_bloc.dart';
import 'package:movieapp/presentation/widgets/logo.dart';

import '../journeys/search_movie/custom_search_movie_delegate.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
          left: Sizes.dimen_16,
          right: Sizes.dimen_16),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/svgs/menu.svg',
              height: Sizes.dimen_12.h,
            ),
          ),
          const Expanded(
            child: Logo(
              height: Sizes.dimen_16,
            ),
          ),
          IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(
                      BlocProvider.of<SearchMoviesBloc>(context)));
            },
            icon: Icon(
              Icons.search,
              size: Sizes.dimen_12.h,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
