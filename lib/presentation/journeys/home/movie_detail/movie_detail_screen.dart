import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/constants/translation_constants.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/common/extensions/string_extension.dart';
import 'package:movieapp/domain/entities/movie_detail_entity.dart';
import 'package:movieapp/presentation/blocs/favourite/favourite_bloc.dart';

import '../../../../di/get_it.dart';
import '../../../blocs/cast/cast_bloc.dart';
import '../../../blocs/get_videos/get_video_bloc.dart';
import '../../../blocs/movie_detail_data/movie_data_bloc.dart';
import 'big_poster.dart';
import 'cast_widget.dart';
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
  late CastBloc castBloc;
  late GetVideoBloc videoBloc;
  late FavouriteBloc favouriteBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieDataBloc = getInstance<MovieDataBloc>();
    movieDataBloc
        .add(MovieDetailLoadEvent(widget.movieDetailArguments.movieID ?? 0));
    castBloc = getInstance<CastBloc>();
    videoBloc = getInstance<GetVideoBloc>();
    favouriteBloc = getInstance<FavouriteBloc>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoBloc.close();
    castBloc.close();
    favouriteBloc.close();
    movieDataBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    //bloc provider used for provide the bloc that will help to use the bloc its child widget
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: movieDataBloc),
          BlocProvider.value(value: castBloc),
          BlocProvider.value(value: videoBloc),
          BlocProvider.value(value: favouriteBloc),
        ],
        child: BlocProvider<MovieDataBloc>.value(
          value: movieDataBloc,
          child: BlocBuilder<MovieDataBloc, MovieDataState>(
            builder: (context, state) {
              if (state is MovieDataLoaded) {
                final MovieDetailEntity movieDetail = state.movieDetailEntity;
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      BigPoster(movie: movieDetail),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Sizes.dimen_16.w,
                            vertical: Sizes.dimen_8.h),
                        child: Text(
                          movieDetail.overview,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
                        child: Text(
                          TranslationConstants.cast.t(context),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      const CastWidget(),
                    ],
                  ),
                );
              } else if (state is MovieDataError) {
                return const CircularProgressIndicator();
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
