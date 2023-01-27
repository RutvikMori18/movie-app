import 'package:hive/hive.dart';
import 'package:movieapp/data/tables/movie_table.dart';

abstract class MovieLocalDataSource {
  Future<void> saveMovie(MovieTable movieTable);
  Future<List<MovieTable>> getMovie();
  Future<void> deleteMovie(int movieId);
  Future<bool> checkIfMovieFav(int movieId);
}

class MovieLocaleDataSourceImpl extends MovieLocalDataSource {
  @override
  Future<bool> checkIfMovieFav(int movieId) async {
    final movieBox = await Hive.openBox('movieBox');
    final result = movieBox.containsKey(movieId);
    return result;
  }

  @override
  Future<void> deleteMovie(int movieId) async {
    final movieBox = await Hive.openBox('movieBox');
    final movieIds = movieBox.delete(movieId);
  }

  @override
  Future<List<MovieTable>> getMovie() async {
    final movieBox = await Hive.openBox('movieBox');
    final movieIds = movieBox.keys;
    List<MovieTable> movies = [];
    movieIds.forEach((element) {
      movies.add(element);
    });
    return movies;
  }

  @override
  Future<void> saveMovie(MovieTable movieTable) async {
    final movieBox = await Hive.openBox('movieBox');
    await movieBox.put(movieTable.id, movieTable);
  }
}
