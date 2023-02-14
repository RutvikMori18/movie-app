import 'dart:convert';

import 'movie_models.dart';

MovieResultModel? movieModelFromJson(String str) =>
    MovieResultModel.fromJson(json.decode(str));

String movieModelToJson(MovieResultModel? data) => json.encode(data!.toJson());

class MovieResultModel {
  MovieResultModel({
    required this.results,
  });

  final List<MovieModel> results;

  factory MovieResultModel.fromJson(Map<String, dynamic> json) =>
      MovieResultModel(
        results: List<MovieModel>.from(
            json["results"]!.map((x) => MovieModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
