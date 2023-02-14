import 'package:flutter/cupertino.dart';
import 'package:movieapp/common/constants/route_constants.dart';
import 'package:movieapp/presentation/journeys/favourite/favourite_screen.dart';
import 'package:movieapp/presentation/journeys/home/home_screen.dart';
import 'package:movieapp/presentation/journeys/home/movie_detail/movie_detail_screen.dart';
import 'package:movieapp/presentation/journeys/watch_video/watch_video_screen.dart';

import 'journeys/home/movie_detail/movie_detail_argument.dart';
import 'journeys/watch_video/watch_video_argument.dart';

class Routes {
  ///TODO : which type of arguments send to the screen
  static Map<String, WidgetBuilder> getRoutes(RouteSettings settings) => {
        RouteList.initial: (context) => const HomeScreen(),
        RouteList.movieDetail: (context) =>
            MovieDetailScreen(movieDetailArguments: settings.arguments as MovieDetailArguments),
        RouteList.favourite: (context) => const FavouriteScreen(),
        RouteList.watchTrailer: (context) =>
            WatchVideoScreen(arguments: settings.arguments as WatchVideoArguments),
      };
}
