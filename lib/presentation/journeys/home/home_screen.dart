import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/di/get_it.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movieapp/presentation/journeys/home/movie_tabbed/movie_tabbed_widget.dart';

import 'movie_carousel/movie_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //initialize the bloc with getInstance
  late MovieCarouselBloc movieCarouselBloc;
  late MovieBackdropBloc movieBackdropBloc;
  late MovieTabbedBloc movieTabbedBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieCarouselBloc = getInstance<MovieCarouselBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
    movieTabbedBloc = getInstance<MovieTabbedBloc>();
    movieTabbedBloc.add(const MovieTabChangedState(currentTabIndex: 0));
    movieCarouselBloc.add(const CarouselLoadEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    movieCarouselBloc.close();
    movieBackdropBloc.close();
    movieTabbedBloc.close();
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
      ],
      child: Scaffold(
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
                }

                return const SizedBox();
              })),
    );
  }
}
