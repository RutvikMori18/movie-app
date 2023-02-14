import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/constants/translation_constants.dart';
import 'package:movieapp/common/extensions/string_extension.dart';
import 'package:movieapp/di/get_it.dart';
import 'package:movieapp/presentation/blocs/favourite/favourite_bloc.dart';

import 'favourite_movie_grid_view_widget.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late FavouriteBloc favouriteBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    favouriteBloc = getInstance<FavouriteBloc>();
    favouriteBloc.add(LoadFavMovieEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    favouriteBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TranslationConstants.favoriteMovies.t(context)),
      ),
      body: BlocProvider.value(
        value: favouriteBloc,
        child: BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state) {
            if (state is FavouriteMovieLoadedState) {
              if (state.movies.isEmpty) {
                return Text(
                  TranslationConstants.noFavoriteMovie.t(context),
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                );
              }
              return FavouriteMovieGridWidget(
                movies: state.movies,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
