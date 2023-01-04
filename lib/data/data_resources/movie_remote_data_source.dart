import 'package:movieapp/data/models/movie_models.dart';
import 'package:movieapp/data/models/movies_result_model.dart';

import '../core/common_api_stracture.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrendingMovies();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getCommingSoon();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  MovieRemoteDataSourceImpl();

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final Map<String, dynamic> response =
        await CommonAPI().getApi('trending/movie/day');
    final List<MovieModel> movies = MovieResultModel.fromMap(response).results;

    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final Map<String, dynamic> response =
        await CommonAPI().getApi('movie/popular');

    final List<MovieModel> movies = MovieResultModel.fromMap(response).results;

    return movies;
  }

  @override
  Future<List<MovieModel>> getCommingSoon() async {
    final Map<String, dynamic> response =
        await CommonAPI().getApi('movie/upcoming');

    final List<MovieModel> movies = MovieResultModel.fromMap(response).results;

    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final Map<String, dynamic> response =
        await CommonAPI().getApi('movie/playing_now');

    final List<MovieModel> movies = MovieResultModel.fromMap(response).results;

    return movies;
  }
}
