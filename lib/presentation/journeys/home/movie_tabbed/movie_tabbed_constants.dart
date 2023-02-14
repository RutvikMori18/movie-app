import 'package:movieapp/presentation/journeys/home/movie_tabbed/tab_model.dart';

import '../../../../common/constants/translation_constants.dart';

class MovieTabbedConstants {
  static List<Tab> movieTabs = [
    Tab(index: 0, title: TranslationConstants.popular),
    Tab(index: 1, title: TranslationConstants.now),
    Tab(index: 2, title: TranslationConstants.soon),
  ];
}
