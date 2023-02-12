import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movieapp/common/screen_util/screenutil.dart';
import 'package:movieapp/di/get_it.dart';
import 'package:movieapp/presentation/app_localizations.dart';
import 'package:movieapp/presentation/journeys/home/home_screen.dart';
import 'package:movieapp/presentation/routes.dart';
import 'package:movieapp/presentation/themes/theme_color.dart';
import 'package:movieapp/presentation/themes/theme_text.dart';
import 'package:movieapp/presentation/wiredash_app.dart';

import '../common/constants/language.dart';
import '../common/constants/route_constants.dart';
import 'blocs/loading/loading_bloc.dart';
import 'blocs/movie_langauge/language_bloc.dart';
import 'fade_page_route_builder.dart';
import 'journeys/loading/loading_screen.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  State<MovieApp> createState() => _MovieAppState();
  static void setLocale(BuildContext context, Locale newLocale) {
    _MovieAppState state = context.findAncestorStateOfType<_MovieAppState>()!;
    state.setLocale(newLocale);
  }
}

class _MovieAppState extends State<MovieApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late LanguageBloc _languageBloc;
  late LoadingBloc loadingBloc;
  Locale? _locale;


  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //to Initilize the util and app locale also
    ScreenUtil.init();
    AppLocalization(const Locale('en'));
    _languageBloc = getInstance<LanguageBloc>();
    _languageBloc.add(LoadPreferredEvent());
    loadingBloc = getInstance<LoadingBloc>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _languageBloc.close();
    loadingBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>.value(value: _languageBloc),
        BlocProvider<LoadingBloc>.value(value: loadingBloc),
      ],

      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return WiredashApp(
              languageCode: state.locale.languageCode,
              child: MaterialApp(
                // navigatorKey: _navigatorKey,
                debugShowCheckedModeBanner: false,
                title: 'Movie app',
                theme: ThemeData(
                  unselectedWidgetColor: AppTheme.vulcan,
                  primaryColor: AppTheme.vulcan,
                  scaffoldBackgroundColor: AppTheme.vulcan,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: ThemeText.getTextTheme(),
                  appBarTheme: const AppBarTheme(elevation: 0.0),
                  colorScheme: ColorScheme.fromSwatch()
                      .copyWith(secondary: AppTheme.royalBlue),
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
                localeResolutionCallback: (deviceLocal, supportedLocales) {
                  for (var local in supportedLocales) {
                    if (local.languageCode == deviceLocal!.languageCode &&
                        local.countryCode == deviceLocal.countryCode) {
                      return deviceLocal;
                    }
                  }
                  return supportedLocales.first;
                },
                home: const HomeScreen(),
                initialRoute: RouteList.initial,
                // builder: (context, child) {
                //   LoadingScreen(screen: child,),
                //   return child ?? Container();
                // },
                // onGenerateRoute: (RouteSettings setting) {
                //   final Map<String, Widget Function(BuildContext)> routes =
                //       Routes.getRoutes(setting);
                //   final WidgetBuilder builder = routes[setting.name]!;
                //   return FadePageRouteBuilder(builder: builder, setting: setting);
                // },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
