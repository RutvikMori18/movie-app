import 'package:flutter/material.dart';
import 'package:movieapp/presentation/themes/theme_color.dart';
import 'package:movieapp/presentation/themes/theme_text.dart';

import 'journeys/home/home_screen.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie app',
      theme: ThemeData(
        primaryColor: AppTheme.vulcan,
        scaffoldBackgroundColor: AppTheme.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0.0),
      ),
      home: const HomeScreen(),
    );
  }
}