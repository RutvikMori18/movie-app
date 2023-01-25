import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/di/get_it.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movieapp/presentation/blocs/search_movies/search_movies_bloc.dart';
import 'package:movieapp/presentation/journeys/home/movie_tabbed/movie_tabbed_widget.dart';

import '../../widgets/app_error.dart';
import '../drawer/navigation_drawer.dart';
import 'movie_carousel/movie_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 0 declare the bloc
  late MovieCarouselBloc movieCarouselBloc;
  late MovieBackdropBloc movieBackdropBloc;
  late MovieTabbedBloc movieTabbedBloc;
  late SearchMoviesBloc searchMoviesBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieCarouselBloc = getInstance<MovieCarouselBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
    // 1 initialize the bloc with getInstance
    movieTabbedBloc = getInstance<MovieTabbedBloc>();
    // 2 use the bloc
    movieTabbedBloc.getPopular;
    // 3 emit the event
    movieTabbedBloc.add(const MovieTabChangedEvent(currentTabIndex: 0));
    movieCarouselBloc.add(const CarouselLoadEvent());
    searchMoviesBloc = getInstance<SearchMoviesBloc>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    movieCarouselBloc.close();
    movieBackdropBloc.close();
    movieTabbedBloc.close();
    searchMoviesBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => movieCarouselBloc,
        ),
        BlocProvider(
          create: (context) => movieBackdropBloc,
        ),
        BlocProvider(
          create: (context) => movieTabbedBloc,
        ),
        BlocProvider(
          create: (context) => searchMoviesBloc,
        ),
      ],
      child: Scaffold(
          drawer: const NavigationDrawer(),
          body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
              bloc: movieCarouselBloc,
              builder: (context, state) {
                if (state is MovieCarouselELoaded) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      FractionallySizedBox(
                        alignment: Alignment.topCenter,
                        heightFactor: 0.6,
                        child: Placeholder(
                          color: Colors.grey,
                          child: MovieCarouselWidget(
                              defaultIndex: 0, movies: state.movies),
                        ),
                      ),
                      const FractionallySizedBox(
                          alignment: Alignment.bottomCenter,
                          heightFactor: 0.4,
                          child: MovieTabbedWidget())
                    ],
                  );
                } else if (state is MovieCarouselError) {
                  return AppErrorWidget(
                    errorType: state.errorType,
                    onPressed: movieCarouselBloc.add(
                      const CarouselLoadEvent(),
                    ),
                  );
                }

                return const SizedBox();
              })),
    );
  }
}
