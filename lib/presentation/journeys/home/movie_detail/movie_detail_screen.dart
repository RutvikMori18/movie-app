import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/domain/entities/movie_detail_entity.dart';

import '../../../../di/get_it.dart';
import '../../../blocs/movie_detail_data/movie_data_bloc.dart';
import 'big_poster.dart';
import 'movie_detail_argument.dart';

class MovieDetailScreen extends StatefulWidget {
  //we will use model that will holds the arguments of the screen so it will easy to declare and used when it has a 5 or 10 arguments
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({Key? key, required this.movieDetailArguments})
      : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDataBloc movieDataBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieDataBloc = getInstance<MovieDataBloc>();
    movieDataBloc
        .add(MovieDetailLoadEvent(widget.movieDetailArguments.movieID ?? 0));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    movieDataBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    //bloc provider used for provide the bloc that will help to use the bloc its child widget
    return Scaffold(
      body: BlocProvider<MovieDataBloc>.value(
        value: movieDataBloc,
        child: BlocBuilder<MovieDataBloc, MovieDataState>(
          builder: (context, state) {
            if (state is MovieDataLoaded) {
              final MovieDetailEntity movieDetail = state.movieDetailEntity;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BigPoster(movie: movieDetail),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
                    child: Text(
                      movieDetail.overview,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              );
            } else if (state is MovieDataError) {
              return Container();
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
