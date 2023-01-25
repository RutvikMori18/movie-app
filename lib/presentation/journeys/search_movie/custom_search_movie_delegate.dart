import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/constants/translation_constants.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/common/extensions/string_extension.dart';
import 'package:movieapp/presentation/blocs/search_movies/search_movies_bloc.dart';
import 'package:movieapp/presentation/journeys/search_movie/search_movie_card.dart';
import 'package:movieapp/presentation/themes/theme_text.dart';

import '../../themes/theme_color.dart';
import '../../widgets/app_error.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchMoviesBloc searchMoviesBloc;

  CustomSearchDelegate(this.searchMoviesBloc);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context).textTheme.greySubtitle1,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: query.isEmpty ? null : () => query = '',
          icon: Icon(
            Icons.clear,
            color: query.isEmpty ? Colors.grey : AppTheme.royalBlue,
            size: Sizes.dimen_12.h,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: Sizes.dimen_12.h,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    searchMoviesBloc.add(SearchMovieDataChangeEvent(searchData: query));
    return BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
      bloc: searchMoviesBloc,
      builder: (context, state) {
        if (state is SearchMoviesError) {
          return AppErrorWidget(
            onPressed: searchMoviesBloc
                .add(SearchMovieDataChangeEvent(searchData: query)),
            errorType: state.errorType,
          );
        } else if (state is SearchMoviesDataState) {
          if (state.result.isEmpty) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
              child: Text(
                TranslationConstants.noMoviesSearched.t(context),
                textAlign: TextAlign.center,
              ),
            );
          }
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) =>
                SearchMovieCard(movie: state.result[index]),
            itemCount: state.result.length,
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}
