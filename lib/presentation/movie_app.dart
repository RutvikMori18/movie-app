import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movieapp/common/screen_util/screenutil.dart';
import 'package:movieapp/di/get_it.dart';
import 'package:movieapp/presentation/app_localizations.dart';
import 'package:movieapp/presentation/themes/theme_color.dart';
import 'package:movieapp/presentation/themes/theme_text.dart';
import 'package:movieapp/presentation/wiredash_app.dart';

import '../common/constants/language.dart';
import 'blocs/movie_langauge/language_bloc.dart';
import 'journeys/home/home_screen.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late LanguageBloc _languageBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //to Initilize the util and app locale also
    ScreenUtil.init();
    _languageBloc = getInstance<LanguageBloc>();
    AppLocalization(const Locale('En'));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _languageBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LanguageBloc>.value(
      value: _languageBloc,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return WiredashApp(
              languageCode: state.locale.languageCode,
              child: MaterialApp(
                navigatorKey: _navigatorKey,
                debugShowCheckedModeBanner: false,
                title: 'Movie app',
                theme: ThemeData(
                  unselectedWidgetColor: AppTheme.vulcan,
                  accentColor: AppTheme.royalBlue,
                  primaryColor: AppTheme.vulcan,
                  scaffoldBackgroundColor: AppTheme.vulcan,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: ThemeText.getTextTheme(),
                  appBarTheme: const AppBarTheme(elevation: 0.0),
                ),
                //used for the language localization
                supportedLocales:
                    Language.languages.map((e) => Locale(e.code)).toList(),
                locale: state.locale,
                localizationsDelegates: [
                  AppLocalization.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                home: const HomeScreen(),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
