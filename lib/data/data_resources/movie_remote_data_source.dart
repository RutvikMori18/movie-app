import 'package:movieapp/data/models/CastCrewResultDataModel.dart';
import 'package:movieapp/data/models/Results.dart';
import 'package:movieapp/data/models/VideoModel.dart';
import 'package:movieapp/data/models/movie_models.dart';
import 'package:movieapp/data/models/movies_result_model.dart';

import '../core/common_api_stracture.dart';
import '../models/movie_detail_model.dart';

abstract class MovieRemoteDataSource {
  /*API CALL ABSTRACT METHODS*/
  Future<List<MovieModel>> getTrendingMovies();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getCommingSoon();
  Future<MovieDataModel> getMovieDetail(int id);
  Future<List<CastModel>> getCastCrew(int id);
  Future<List<Results>> getVideos(int id);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  MovieRemoteDataSourceImpl();
/*FOR API CALL  FUNCTIONS*/
  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final Map<String, dynamic> response =
        await CommonAPI().getApi('trending/movie/day');
    final List<MovieModel> movies = MovieResultModel.fromJson(response).results;

    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final Map<String, dynamic> response =
        await CommonAPI().getApi('movie/popular');

    final List<MovieModel> movies = MovieResultModel.fromJson(response).results;

    return movies;
  }

  @override
  Future<List<MovieModel>> getCommingSoon() async {
    final Map<String, dynamic> response =
        await CommonAPI().getApi('movie/upcoming');

    final List<MovieModel> movies = MovieResultModel.fromJson(response).results;

    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final Map<String, dynamic> response =
        await CommonAPI().getApi('movie/now_playing');

    final List<MovieModel> movies = MovieResultModel.fromJson(response).results;

    return movies;
  }

  @override
  Future<MovieDataModel> getMovieDetail(int id) async {
    final Map<String, dynamic> response = await CommonAPI().getApi('movie/$id');

    final MovieDataModel movie = MovieDataModel.fromJson(response);
    print(movie);
    return movie;
  }

  @override
  Future<List<CastModel>> getCastCrew(int id) async {
    final Map<String, dynamic> response =
        await CommonAPI().getApi('movie/$id/credits');

    final List<CastModel> movie =
        CastCrewResultDataModel.fromJson(response).cast ?? [];
    print(movie);
    return movie;
  }

  @override
  Future<List<Results>> getVideos(int id) async {
    final Map<String, dynamic> response =
        await CommonAPI().getApi('movie/$id/videos');

    final List<Results> videosList =
        VideoModel.fromJson(response).results ?? [];
    print(videosList);
    return videosList;
  }
}
